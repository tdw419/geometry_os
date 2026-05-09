; DESCRIPTION: Draws a blue circle centered at (291, 208) with radius 20.
; PLAN: r0=291(x), r1=208(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 208
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
