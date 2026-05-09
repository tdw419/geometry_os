; DESCRIPTION: Creates a purple circular shape at (250, 183) with radius 45.
; PLAN: r0=250(x), r1=183(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 183
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
