; DESCRIPTION: Draws a black circle centered at (139, 233) with radius 20.
; PLAN: r0=139(x), r1=233(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 233
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
