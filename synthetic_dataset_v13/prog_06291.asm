; DESCRIPTION: Draws a blue circle centered at (421, 206) with radius 13.
; PLAN: r0=421(x), r1=206(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 206
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
