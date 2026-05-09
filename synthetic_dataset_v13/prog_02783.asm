; DESCRIPTION: Composite: Draws a black circle centered at (56, 181) with radius 42 then Sets a single blue pixel at (208, 175).
; PLAN: r0=56(x), r1=181(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x), r6=175(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 56
LDI r1, 181
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 175
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
