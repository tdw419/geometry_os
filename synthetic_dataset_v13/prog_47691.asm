; DESCRIPTION: Draws a black circle centered at (211, 79) with radius 52.
; PLAN: r0=211(x), r1=79(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 79
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
