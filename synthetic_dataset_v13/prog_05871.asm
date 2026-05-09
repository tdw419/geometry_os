; DESCRIPTION: Creates a black circular shape at (136, 21) with radius 15.
; PLAN: r0=136(x), r1=21(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 21
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
