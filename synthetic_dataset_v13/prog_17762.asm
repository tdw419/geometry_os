; DESCRIPTION: Draws a magenta line from (144, 64) to (113, 208).
; PLAN: r0=144(x1), r1=64(y1), r2=113(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 64
LDI r2, 113
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
