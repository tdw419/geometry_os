; DESCRIPTION: Composite: Draws a magenta circle centered at (381, 74) with radius 63 then Sets a single blue pixel at (2, 147).
; PLAN: r0=381(x), r1=74(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=2(x), r6=147(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 381
LDI r1, 74
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 2
LDI r6, 147
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
