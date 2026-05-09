; DESCRIPTION: Draws a blue circle centered at (329, 157) with radius 39.
; PLAN: r0=329(x), r1=157(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 157
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
