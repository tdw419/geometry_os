; DESCRIPTION: Composite: Sets a single green pixel at (104, 170) then Places a black 37x49 rectangle at position (36, 51).
; PLAN: r0=104(x), r1=170(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=36(x), r6=51(y), r7=37(width), r8=49(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 170
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 36
LDI r6, 51
LDI r7, 37
LDI r8, 49
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
