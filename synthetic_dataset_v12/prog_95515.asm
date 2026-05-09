; DESCRIPTION: Draws a blue circle centered at (90, 43) with radius 28.
; PLAN: r0=90(x), r1=43(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 43
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
