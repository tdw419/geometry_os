; DESCRIPTION: Draws a black circle centered at (212, 113) with radius 65.
; PLAN: r0=212(x), r1=113(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 113
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
