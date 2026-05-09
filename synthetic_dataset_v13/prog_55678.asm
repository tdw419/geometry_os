; DESCRIPTION: Draws a black circle centered at (150, 17) with radius 11.
; PLAN: r0=150(x), r1=17(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 17
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
