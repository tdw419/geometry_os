; DESCRIPTION: Creates a purple circular shape at (351, 134) with radius 32.
; PLAN: r0=351(x), r1=134(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 134
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
