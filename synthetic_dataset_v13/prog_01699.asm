; DESCRIPTION: Creates a black circular shape at (104, 126) with radius 43.
; PLAN: r0=104(x), r1=126(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 126
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
