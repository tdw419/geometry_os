; DESCRIPTION: Draws a blue circle centered at (164, 135) with radius 76.
; PLAN: r0=164(x), r1=135(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 135
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
