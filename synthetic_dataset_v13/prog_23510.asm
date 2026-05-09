; DESCRIPTION: Composite: Draws a orange circle centered at (246, 139) with radius 26 then Places a blue dot at position (83, 156).
; PLAN: r0=246(x), r1=139(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x), r6=156(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 246
LDI r1, 139
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 156
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
