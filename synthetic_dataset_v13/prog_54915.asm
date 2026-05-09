; DESCRIPTION: Composite: Places a white dot at position (260, 106) then Creates a red circular shape at (427, 104) with radius 36.
; PLAN: r0=260(x), r1=106(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=427(x), r6=104(y), r7=36(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 260
LDI r1, 106
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 427
LDI r6, 104
LDI r7, 36
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
