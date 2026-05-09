; DESCRIPTION: Draws a blue circle centered at (356, 183) with radius 73.
; PLAN: r0=356(x), r1=183(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 183
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
