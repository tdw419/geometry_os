; DESCRIPTION: Places a purple line segment connecting (351, 123) to (454, 24).
; PLAN: r0=351(x1), r1=123(y1), r2=454(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 123
LDI r2, 454
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
