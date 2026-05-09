; DESCRIPTION: Draws a magenta line from (113, 6) to (144, 46).
; PLAN: r0=113(x1), r1=6(y1), r2=144(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 6
LDI r2, 144
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
