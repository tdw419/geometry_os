; DESCRIPTION: Draws a black circle centered at (232, 109) with radius 12.
; PLAN: r0=232(x), r1=109(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 109
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
