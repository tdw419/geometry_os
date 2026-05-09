; DESCRIPTION: Composite: Sets a single black pixel at (417, 249) then Creates a green circular shape at (184, 212) with radius 41.
; PLAN: r0=417(x), r1=249(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=184(x), r6=212(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 417
LDI r1, 249
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 184
LDI r6, 212
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
