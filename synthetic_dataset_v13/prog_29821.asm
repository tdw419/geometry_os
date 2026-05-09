; DESCRIPTION: Draws a black circle centered at (232, 107) with radius 79.
; PLAN: r0=232(x), r1=107(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 107
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
