; DESCRIPTION: Draws a blue circle centered at (136, 69) with radius 48.
; PLAN: r0=136(x), r1=69(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 69
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
