; DESCRIPTION: Draws a blue circle centered at (176, 102) with radius 73.
; PLAN: r0=176(x), r1=102(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 102
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
