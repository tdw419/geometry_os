; DESCRIPTION: Draws a blue circle centered at (136, 178) with radius 25.
; PLAN: r0=136(x), r1=178(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 178
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
