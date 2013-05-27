" Vim global plugin that provides access to the sprunge.us pastebin.
" Requires +python support for request http.
"
" Add this to your ~/.vim/plugin/ directory. Then you can use
"
" :LoadSprunge
" 	to send the current buffer to sprunge.us and returns 
"       link of loaded content
"
" Version:      0.1
" Last Change:  27 May 2013
" Maintainer:   Ciro Somma <miclen.developers@gmail.com>


if has('python')
  command! LoadSprunge python load()
else
  command! LoadSprunge echo 'Only avaliable with +python support.'
endif

if has('python')
python << EOF

def load():
  import urllib
  import vim

  url = 'http://sprunge.us'
  data = {
    'sprunge':'\n'.join(vim.current.buffer),
    'submit':'Submit'
  }

  response = urllib.urlopen(url, urllib.urlencode(data))
  print 'Loading..'
  page = response.read()
  print page
EOF
endif
