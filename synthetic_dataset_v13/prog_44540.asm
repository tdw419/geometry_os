; DESCRIPTION: Draws a black circle centered at (225, 147) with radius 23.
; PLAN: r0=225(x), r1=147(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 147
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
