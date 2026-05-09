; DESCRIPTION: Composite: Creates a cyan circular shape at (211, 44) with radius 15 then Places a orange dot at position (496, 137).
; PLAN: r0=211(x), r1=44(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=496(x), r6=137(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 211
LDI r1, 44
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 496
LDI r6, 137
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
