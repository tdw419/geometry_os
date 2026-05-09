; DESCRIPTION: Draws a white circle centered at (409, 155) with radius 66.
; PLAN: r0=409(x), r1=155(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 155
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
