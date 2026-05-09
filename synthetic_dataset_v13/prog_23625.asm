; DESCRIPTION: Places a purple line segment connecting (119, 31) to (201, 31).
; PLAN: r0=119(x1), r1=31(y1), r2=201(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 31
LDI r2, 201
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
