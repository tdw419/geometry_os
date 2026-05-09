; DESCRIPTION: Draws a white circle centered at (454, 232) with radius 24.
; PLAN: r0=454(x), r1=232(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 454
LDI r1, 232
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
