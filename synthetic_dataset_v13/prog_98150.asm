; DESCRIPTION: Places a purple line segment connecting (253, 73) to (201, 122).
; PLAN: r0=253(x1), r1=73(y1), r2=201(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 73
LDI r2, 201
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
