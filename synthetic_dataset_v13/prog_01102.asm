; DESCRIPTION: Composite: Sets a single purple pixel at (467, 71) then Places a red circle of radius 66 at center (434, 75).
; PLAN: r0=467(x), r1=71(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=434(x), r6=75(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 467
LDI r1, 71
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 434
LDI r6, 75
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
