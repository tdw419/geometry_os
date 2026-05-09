; DESCRIPTION: Creates a purple circular shape at (351, 73) with radius 64.
; PLAN: r0=351(x), r1=73(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 73
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
