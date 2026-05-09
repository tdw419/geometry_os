; DESCRIPTION: Draws a blue circle centered at (332, 74) with radius 22.
; PLAN: r0=332(x), r1=74(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 74
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
