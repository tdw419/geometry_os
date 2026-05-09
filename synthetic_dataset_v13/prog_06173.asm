; DESCRIPTION: Draws a blue circle centered at (417, 134) with radius 69.
; PLAN: r0=417(x), r1=134(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 134
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
