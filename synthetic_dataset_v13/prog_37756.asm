; DESCRIPTION: Composite: Sets a single purple pixel at (273, 182) then Creates a orange rectangular region at (448, 89) spanning 37 by 88 pixels.
; PLAN: r0=273(x), r1=182(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=448(x), r6=89(y), r7=37(width), r8=88(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 182
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 448
LDI r6, 89
LDI r7, 37
LDI r8, 88
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
