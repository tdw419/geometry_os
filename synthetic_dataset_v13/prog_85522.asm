; DESCRIPTION: Draws a blue circle centered at (172, 43) with radius 19.
; PLAN: r0=172(x), r1=43(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 43
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
