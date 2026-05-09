; DESCRIPTION: Composite: Creates a orange circular shape at (282, 106) with radius 28 then Places a red dot at position (376, 160).
; PLAN: r0=282(x), r1=106(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=160(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 282
LDI r1, 106
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 160
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
