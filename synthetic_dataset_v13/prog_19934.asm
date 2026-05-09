; DESCRIPTION: Draws a black circle centered at (357, 58) with radius 12.
; PLAN: r0=357(x), r1=58(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 58
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
