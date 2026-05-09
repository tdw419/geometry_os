; DESCRIPTION: Creates a black circular shape at (62, 106) with radius 23.
; PLAN: r0=62(x), r1=106(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 106
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
