; DESCRIPTION: Creates a black circular shape at (361, 116) with radius 40.
; PLAN: r0=361(x), r1=116(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 116
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
