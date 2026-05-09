; DESCRIPTION: Draws a black circle centered at (274, 104) with radius 54.
; PLAN: r0=274(x), r1=104(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 104
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
