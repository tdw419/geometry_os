; DESCRIPTION: Draws a black circle centered at (357, 185) with radius 17.
; PLAN: r0=357(x), r1=185(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 185
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
