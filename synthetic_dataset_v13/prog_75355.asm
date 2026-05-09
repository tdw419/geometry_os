; DESCRIPTION: Draws a blue circle centered at (227, 120) with radius 39.
; PLAN: r0=227(x), r1=120(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 120
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
