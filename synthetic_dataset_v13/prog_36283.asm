; DESCRIPTION: Draws a blue circle centered at (214, 123) with radius 37.
; PLAN: r0=214(x), r1=123(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 123
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
