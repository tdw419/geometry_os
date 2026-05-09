; DESCRIPTION: Draws a black circle centered at (453, 86) with radius 17.
; PLAN: r0=453(x), r1=86(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 86
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
