; DESCRIPTION: Creates a white circular shape at (257, 165) with radius 79.
; PLAN: r0=257(x), r1=165(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 165
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
