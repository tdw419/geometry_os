; DESCRIPTION: Draws a black circle centered at (216, 123) with radius 77.
; PLAN: r0=216(x), r1=123(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 123
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
