; DESCRIPTION: Creates a black circular shape at (257, 76) with radius 54.
; PLAN: r0=257(x), r1=76(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 76
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
