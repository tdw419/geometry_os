; DESCRIPTION: Places a purple line segment connecting (124, 216) to (472, 227).
; PLAN: r0=124(x1), r1=216(y1), r2=472(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 216
LDI r2, 472
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
