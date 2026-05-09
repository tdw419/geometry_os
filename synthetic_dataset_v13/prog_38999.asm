; DESCRIPTION: Creates a purple circular shape at (211, 183) with radius 65.
; PLAN: r0=211(x), r1=183(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 183
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
