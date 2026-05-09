; DESCRIPTION: Draws a blue circle centered at (123, 136) with radius 68.
; PLAN: r0=123(x), r1=136(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 136
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
