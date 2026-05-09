; DESCRIPTION: Creates a black circular shape at (62, 172) with radius 29.
; PLAN: r0=62(x), r1=172(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 172
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
