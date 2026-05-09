; DESCRIPTION: Draws a black circle centered at (273, 113) with radius 15.
; PLAN: r0=273(x), r1=113(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 113
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
