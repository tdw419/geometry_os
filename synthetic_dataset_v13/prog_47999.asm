; DESCRIPTION: Places a blue line segment connecting (212, 100) to (390, 73).
; PLAN: r0=212(x1), r1=100(y1), r2=390(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 100
LDI r2, 390
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
