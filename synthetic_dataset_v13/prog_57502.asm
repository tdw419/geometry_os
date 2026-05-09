; DESCRIPTION: Draws a blue circle centered at (60, 192) with radius 43.
; PLAN: r0=60(x), r1=192(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 192
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
