; DESCRIPTION: Composite: Sets a single red pixel at (26, 98) then Places a red circle of radius 42 at center (451, 179).
; PLAN: r0=26(x), r1=98(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=451(x), r6=179(y), r7=42(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 26
LDI r1, 98
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 451
LDI r6, 179
LDI r7, 42
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
