; DESCRIPTION: Creates a purple circular shape at (142, 183) with radius 35.
; PLAN: r0=142(x), r1=183(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 183
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
