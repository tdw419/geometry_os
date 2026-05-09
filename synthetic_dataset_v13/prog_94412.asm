; DESCRIPTION: Draws a blue circle centered at (292, 142) with radius 64.
; PLAN: r0=292(x), r1=142(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 142
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
