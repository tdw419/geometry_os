; DESCRIPTION: Draws a blue circle centered at (316, 138) with radius 19.
; PLAN: r0=316(x), r1=138(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 138
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
