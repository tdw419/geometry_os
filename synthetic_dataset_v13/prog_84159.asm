; DESCRIPTION: Places a purple line segment connecting (496, 122) to (227, 212).
; PLAN: r0=496(x1), r1=122(y1), r2=227(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 122
LDI r2, 227
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
