; DESCRIPTION: Draws a blue circle centered at (289, 171) with radius 24.
; PLAN: r0=289(x), r1=171(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 171
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
