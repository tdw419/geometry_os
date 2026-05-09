; DESCRIPTION: Draws a black circle centered at (369, 123) with radius 37.
; PLAN: r0=369(x), r1=123(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 123
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
