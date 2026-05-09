; DESCRIPTION: Creates a black circular shape at (105, 122) with radius 31.
; PLAN: r0=105(x), r1=122(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 122
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
