; DESCRIPTION: Composite: Places a black dot at position (248, 85) then Places a cyan circle of radius 69 at center (159, 97).
; PLAN: r0=248(x), r1=85(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=159(x), r6=97(y), r7=69(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 248
LDI r1, 85
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 159
LDI r6, 97
LDI r7, 69
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
