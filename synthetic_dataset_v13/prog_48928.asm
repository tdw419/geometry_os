; DESCRIPTION: Draws a black circle centered at (418, 79) with radius 78.
; PLAN: r0=418(x), r1=79(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 79
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
