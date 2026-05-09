; DESCRIPTION: Creates a black circular shape at (426, 119) with radius 26.
; PLAN: r0=426(x), r1=119(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 119
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
