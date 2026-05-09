; DESCRIPTION: Draws a blue circle centered at (244, 103) with radius 79.
; PLAN: r0=244(x), r1=103(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 103
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
