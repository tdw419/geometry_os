; DESCRIPTION: Creates a black circular shape at (430, 114) with radius 78.
; PLAN: r0=430(x), r1=114(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 114
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
