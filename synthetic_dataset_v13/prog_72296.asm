; DESCRIPTION: Composite: Places a orange dot at position (508, 218) then Creates a green circular shape at (343, 75) with radius 26.
; PLAN: r0=508(x), r1=218(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=343(x), r6=75(y), r7=26(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 508
LDI r1, 218
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 343
LDI r6, 75
LDI r7, 26
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
