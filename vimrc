" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
" runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
  set hls
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif
"if has("autocmd")
"filetype plugin indent on
"endif

"set smartindent
"set tabstop=4
"set shiftwidth=4
"set expandtab
"set smartindent

let Tlist_Ctags_Cmd = '/usr/bin/ctags'      " 設置ctags命令目錄
let Tlist_Show_One_File = 1             " 不同時顯示多個文件的tag，只顯示當前文件的
let Tlist_Exit_OnlyWindow =  1          " 如果taglist窗口是最後一個窗口，則退出vim
let Tlist_Use_Right_Window = 1          " 讓taglist窗口在右側顯示

" The following are commented out as they cause vim to behave a lot

" differently from regular Vi. They are highly recommended though.
"set showcmd        " Show (partial) command in status line.
"set showmatch      " Show matching brackets.
"set ignorecase     " Do case insensitive matching
"set smartcase      " Do smart case matching
"set incsearch      " Incremental search
"set autowrite      " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'

"autocmd FileType c setlocal shiftwidth=2 softtabstop=4

if has("cscope")
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb

" add any database in current directory
if filereadable("cscope.out")
cs add cscope.out
" else add database pointed to by environment
elseif $CSCOPE_DB != ""
cs add $CSCOPE_DB
endif

set csverb
set cscopetag
set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-
endif

" https://blog.listnukira.com/Vim-Solarized-color-theme/
syntax enable
set background=dark
set t_Co=16
let g:solarized_termcolors=256
"colorscheme solarized
colorscheme vim-monokai-tasty
"set background=light

"set t_Co=256
"colorscheme 256-jungle
"set bg=dark
" colorscheme murphy
" colorscheme koehler
" colorscheme industry
" set colorscheme=murphy --> Centos
" colorscheme murphy --> ubuntu

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

set cursorline " highlight the whole current line
"hi cursorline cterm=none ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" nnoremap <silent><F2> :TlistToggle<CR>
" let Tlist_winWidth = 50
map <f10> :map<CR>
map <f9> :Tlist<CR>
map <f8> <ESC> :NERDTreeToggle<CR> " Toggles NERD Tree view (File viewer)
"map <f7> :registers<CR>
map <f7> <ESC>:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white<CR>
" map <f6> :set list!<BAR>set list?<CR>
" map <f5> :set hls!<BAR>set hls?<CR>
" map <f2> :map<CR>
map <f6> :split<CR>
map <F3> :execute "lvimgrep /" . expand("<cword>") . "/gj **/*" <Bar> lw<CR>

map <C-Right> :tabnext<CR>
map <C-Left> :tabprevious<CR>
" map sa :exec "/\\(".getreg('/')."\\)\\\\|".expand("<cword>")<CR>
map sa :exec "/\\(".getreg('/')."\\)\\\\|".expand("<cword>")<CR>

" turn on NERDTree
nnoremap <silent> <F5> :NERDTree<CR>

vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
