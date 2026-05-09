; DESCRIPTION: Draws a black circle centered at (334, 185) with radius 29.
; PLAN: r0=334(x), r1=185(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 185
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
