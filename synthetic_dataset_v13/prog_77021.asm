; DESCRIPTION: Composite: Sets a single cyan pixel at (159, 82) then Places a orange circle of radius 26 at center (427, 211).
; PLAN: r0=159(x), r1=82(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=427(x), r6=211(y), r7=26(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 159
LDI r1, 82
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 427
LDI r6, 211
LDI r7, 26
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
