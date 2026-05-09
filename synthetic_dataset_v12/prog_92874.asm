; DESCRIPTION: Creates a black circular shape at (316, 132) with radius 60.
; PLAN: r0=316(x), r1=132(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 132
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
