; DESCRIPTION: Composite: Draws a blue circle centered at (151, 63) with radius 16 then Sets a single black pixel at (483, 126).
; PLAN: r0=151(x), r1=63(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x), r6=126(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 151
LDI r1, 63
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 126
LDI r7, 0x000000
PSET r5, r6, r7
HALT
