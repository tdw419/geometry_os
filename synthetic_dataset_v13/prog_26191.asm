; DESCRIPTION: Draws a black circle centered at (140, 184) with radius 23.
; PLAN: r0=140(x), r1=184(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 184
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
