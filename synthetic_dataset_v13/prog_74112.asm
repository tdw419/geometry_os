; DESCRIPTION: Draws a black circle centered at (346, 201) with radius 43.
; PLAN: r0=346(x), r1=201(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 201
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
