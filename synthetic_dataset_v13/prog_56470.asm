; DESCRIPTION: Draws a black circle centered at (227, 134) with radius 58.
; PLAN: r0=227(x), r1=134(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 134
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
