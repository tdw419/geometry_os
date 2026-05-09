; DESCRIPTION: Creates a black circular shape at (332, 61) with radius 42.
; PLAN: r0=332(x), r1=61(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 61
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
