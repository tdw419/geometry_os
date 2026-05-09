; DESCRIPTION: Creates a black circular shape at (452, 128) with radius 33.
; PLAN: r0=452(x), r1=128(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 128
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
