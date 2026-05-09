; DESCRIPTION: Draws a black circle centered at (355, 183) with radius 47.
; PLAN: r0=355(x), r1=183(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 183
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
