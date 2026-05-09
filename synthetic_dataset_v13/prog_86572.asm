; DESCRIPTION: Composite: Draws a blue circle centered at (268, 84) with radius 63 then Sets a single blue pixel at (72, 22).
; PLAN: r0=268(x), r1=84(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=72(x), r6=22(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 268
LDI r1, 84
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 72
LDI r6, 22
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
