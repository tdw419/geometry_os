; DESCRIPTION: Composite: Sets a single black pixel at (376, 81) then Creates a cyan circular shape at (317, 41) with radius 36.
; PLAN: r0=376(x), r1=81(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=41(y), r7=36(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 376
LDI r1, 81
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 317
LDI r6, 41
LDI r7, 36
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
