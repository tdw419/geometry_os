; DESCRIPTION: Composite: Sets a single purple pixel at (449, 56) then Draws a red rectangle at (83, 201) with width 92 and height 49.
; PLAN: r0=449(x), r1=56(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=83(x), r6=201(y), r7=92(width), r8=49(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 449
LDI r1, 56
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 83
LDI r6, 201
LDI r7, 92
LDI r8, 49
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
