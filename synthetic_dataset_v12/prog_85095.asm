; DESCRIPTION: Composite: Draws a black circle centered at (304, 95) with radius 18 then Sets a single red pixel at (66, 181).
; PLAN: r0=304(x), r1=95(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x), r6=181(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 304
LDI r1, 95
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 181
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
