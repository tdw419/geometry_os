; DESCRIPTION: Places a purple line segment connecting (86, 129) to (478, 183).
; PLAN: r0=86(x1), r1=129(y1), r2=478(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 129
LDI r2, 478
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
