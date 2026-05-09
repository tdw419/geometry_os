; DESCRIPTION: Creates a black circular shape at (225, 184) with radius 43.
; PLAN: r0=225(x), r1=184(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 184
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
