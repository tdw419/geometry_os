; DESCRIPTION: Creates a black circular shape at (66, 122) with radius 43.
; PLAN: r0=66(x), r1=122(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 122
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
