; DESCRIPTION: Draws a black circle centered at (78, 163) with radius 66.
; PLAN: r0=78(x), r1=163(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 163
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
