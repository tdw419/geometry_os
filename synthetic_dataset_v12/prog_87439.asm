; DESCRIPTION: Creates a black circular shape at (36, 203) with radius 34.
; PLAN: r0=36(x), r1=203(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 203
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
