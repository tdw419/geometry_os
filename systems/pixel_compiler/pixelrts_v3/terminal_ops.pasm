; PixelRTS v3 Geometric Terminal Operations
; Extends the instruction set with terminal-specific opcodes
;
; Terminal Opcodes (0x40-0x4F):
;   0x40 PUTC  - Print character (G=char, B=fg_color, A=cursor_pos)
;   0x41 MVCR  - Move cursor (G=x, B=y)
;   0x42 SCRL  - Scroll (G=lines)
;   0x43 CLR   - Clear screen
;   0x44 SETFG - Set foreground color (G=color_index)
;   0x45 SETBG - Set background color (G=color_index)
;   0x46 CLREOL- Clear to end of line
;   0x47 BELL  - Terminal bell
;
; Example: Print "HI" at cursor position 0

; Set foreground color to bright green (10)
LDI r1, 10      ; color index
; SETFG r1 would be encoded as R=0x44, G=r1

; Print 'H' (ASCII 72) at position 0
LDI r2, 72      ; 'H' character
LDI r3, 0       ; cursor position
; PUTC r2, r3 would be encoded as R=0x40, G=72, B=10, A=0

; Print 'I' (ASCII 73) at position 1
LDI r4, 73      ; 'I' character
LDI r5, 1       ; cursor position
; PUTC r4, r5 would be encoded as R=0x40, G=73, B=10, A=1

HALT
