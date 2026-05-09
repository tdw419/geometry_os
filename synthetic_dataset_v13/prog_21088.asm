; DESCRIPTION: Places a magenta line segment connecting (127, 227) to (450, 155).
; PLAN: r0=127(x1), r1=227(y1), r2=450(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 227
LDI r2, 450
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
