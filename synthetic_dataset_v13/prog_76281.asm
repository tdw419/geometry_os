; DESCRIPTION: Draws a blue circle centered at (101, 210) with radius 20.
; PLAN: r0=101(x), r1=210(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 210
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
