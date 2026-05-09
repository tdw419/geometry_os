; DESCRIPTION: Composite: Draws a black circle centered at (172, 131) with radius 79 then Places a magenta dot at position (407, 245).
; PLAN: r0=172(x), r1=131(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=407(x), r6=245(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 172
LDI r1, 131
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 407
LDI r6, 245
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
