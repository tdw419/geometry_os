; DESCRIPTION: Draws a black circle centered at (75, 52) with radius 43.
; PLAN: r0=75(x), r1=52(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 52
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
