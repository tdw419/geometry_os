; DESCRIPTION: Creates a black circular shape at (136, 149) with radius 24.
; PLAN: r0=136(x), r1=149(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 149
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
