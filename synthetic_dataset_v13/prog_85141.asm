; DESCRIPTION: Places a purple line segment connecting (119, 193) to (444, 183).
; PLAN: r0=119(x1), r1=193(y1), r2=444(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 193
LDI r2, 444
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
