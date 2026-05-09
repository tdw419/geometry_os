; DESCRIPTION: Draws a blue circle centered at (421, 79) with radius 40.
; PLAN: r0=421(x), r1=79(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 79
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
