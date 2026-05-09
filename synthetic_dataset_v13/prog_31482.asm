; DESCRIPTION: Places a purple line segment connecting (245, 110) to (22, 1).
; PLAN: r0=245(x1), r1=110(y1), r2=22(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 110
LDI r2, 22
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
