; DESCRIPTION: Places a purple circle of radius 78 at center (119, 145).
; PLAN: r0=119(x), r1=145(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 145
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
