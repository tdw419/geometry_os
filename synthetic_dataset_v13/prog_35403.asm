; DESCRIPTION: Composite: Sets a single black pixel at (341, 170) then Creates a red circular shape at (50, 159) with radius 41.
; PLAN: r0=341(x), r1=170(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=50(x), r6=159(y), r7=41(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 170
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 50
LDI r6, 159
LDI r7, 41
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
