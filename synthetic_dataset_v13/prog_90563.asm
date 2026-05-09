; DESCRIPTION: Places a magenta line segment connecting (155, 205) to (330, 121).
; PLAN: r0=155(x1), r1=205(y1), r2=330(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 205
LDI r2, 330
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
