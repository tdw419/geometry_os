; DESCRIPTION: Places a magenta line segment connecting (22, 232) to (390, 123).
; PLAN: r0=22(x1), r1=232(y1), r2=390(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 232
LDI r2, 390
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
