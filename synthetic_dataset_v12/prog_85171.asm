; DESCRIPTION: Places a purple line segment connecting (56, 110) to (377, 102).
; PLAN: r0=56(x1), r1=110(y1), r2=377(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 110
LDI r2, 377
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
