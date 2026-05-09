; DESCRIPTION: Composite: Draws a orange circle centered at (58, 112) with radius 52 then Places a orange dot at position (85, 179).
; PLAN: r0=58(x), r1=112(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=179(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 58
LDI r1, 112
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 179
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
