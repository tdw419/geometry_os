; DESCRIPTION: Creates a purple circular shape at (185, 106) with radius 37.
; PLAN: r0=185(x), r1=106(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 106
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
