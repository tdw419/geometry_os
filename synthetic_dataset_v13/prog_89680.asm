; DESCRIPTION: Places a blue line segment connecting (144, 131) to (97, 22).
; PLAN: r0=144(x1), r1=131(y1), r2=97(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 131
LDI r2, 97
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
