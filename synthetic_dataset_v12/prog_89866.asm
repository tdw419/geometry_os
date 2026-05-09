; DESCRIPTION: Creates a purple circular shape at (332, 61) with radius 32.
; PLAN: r0=332(x), r1=61(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 61
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
