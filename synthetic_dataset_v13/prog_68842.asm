; DESCRIPTION: Composite: Sets a single purple pixel at (477, 253) then Draws a cyan circle centered at (427, 180) with radius 62.
; PLAN: r0=477(x), r1=253(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=427(x), r6=180(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 477
LDI r1, 253
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 427
LDI r6, 180
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
