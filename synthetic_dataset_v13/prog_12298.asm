; DESCRIPTION: Places a magenta line segment connecting (188, 56) to (141, 222).
; PLAN: r0=188(x1), r1=56(y1), r2=141(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 56
LDI r2, 141
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
