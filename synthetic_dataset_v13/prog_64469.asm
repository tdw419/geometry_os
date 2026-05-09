; DESCRIPTION: Draws a white circle centered at (159, 136) with radius 66.
; PLAN: r0=159(x), r1=136(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 136
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
