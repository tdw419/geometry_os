; DESCRIPTION: Draws a black circle centered at (54, 123) with radius 45.
; PLAN: r0=54(x), r1=123(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 123
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
