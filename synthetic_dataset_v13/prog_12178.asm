; DESCRIPTION: Composite: Draws a orange circle centered at (148, 185) with radius 30 then Places a orange dot at position (257, 1).
; PLAN: r0=148(x), r1=185(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x), r6=1(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 148
LDI r1, 185
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 1
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
