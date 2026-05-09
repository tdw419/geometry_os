; DESCRIPTION: Draws a black circle centered at (418, 110) with radius 57.
; PLAN: r0=418(x), r1=110(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 110
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
