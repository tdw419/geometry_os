; DESCRIPTION: Places a purple line segment connecting (219, 227) to (173, 130).
; PLAN: r0=219(x1), r1=227(y1), r2=173(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 227
LDI r2, 173
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
