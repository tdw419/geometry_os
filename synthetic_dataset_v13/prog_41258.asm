; DESCRIPTION: Draws a blue circle centered at (134, 140) with radius 74.
; PLAN: r0=134(x), r1=140(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 140
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
