; DESCRIPTION: Creates a black circular shape at (76, 128) with radius 57.
; PLAN: r0=76(x), r1=128(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 128
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
