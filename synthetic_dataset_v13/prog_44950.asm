; DESCRIPTION: Composite: Places a cyan dot at position (89, 106) then Creates a black circular shape at (241, 112) with radius 19.
; PLAN: r0=89(x), r1=106(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=112(y), r7=19(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 89
LDI r1, 106
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 241
LDI r6, 112
LDI r7, 19
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
