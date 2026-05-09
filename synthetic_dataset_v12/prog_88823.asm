; DESCRIPTION: Places a purple line segment connecting (478, 105) to (191, 254).
; PLAN: r0=478(x1), r1=105(y1), r2=191(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 105
LDI r2, 191
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
