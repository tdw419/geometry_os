; DESCRIPTION: Draws a black circle centered at (136, 155) with radius 71.
; PLAN: r0=136(x), r1=155(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 155
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
