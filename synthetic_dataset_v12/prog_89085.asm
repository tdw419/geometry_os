; DESCRIPTION: Draws a blue circle centered at (49, 154) with radius 19.
; PLAN: r0=49(x), r1=154(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 154
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
