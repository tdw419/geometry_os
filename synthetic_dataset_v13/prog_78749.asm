; DESCRIPTION: Draws a black circle centered at (104, 81) with radius 44.
; PLAN: r0=104(x), r1=81(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 81
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
