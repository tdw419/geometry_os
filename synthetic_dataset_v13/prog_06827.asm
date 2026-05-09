; DESCRIPTION: Creates a black circular shape at (289, 138) with radius 61.
; PLAN: r0=289(x), r1=138(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 138
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
