; DESCRIPTION: Composite: Places a purple dot at position (468, 41) then Creates a black circular shape at (438, 182) with radius 17.
; PLAN: r0=468(x), r1=41(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=438(x), r6=182(y), r7=17(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 468
LDI r1, 41
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 438
LDI r6, 182
LDI r7, 17
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
