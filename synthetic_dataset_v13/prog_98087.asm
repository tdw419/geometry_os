; DESCRIPTION: Composite: Sets a single black pixel at (343, 155) then Places a red circle of radius 37 at center (259, 109).
; PLAN: r0=343(x), r1=155(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=259(x), r6=109(y), r7=37(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 343
LDI r1, 155
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 259
LDI r6, 109
LDI r7, 37
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
