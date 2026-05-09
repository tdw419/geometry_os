; DESCRIPTION: Composite: Sets a single purple pixel at (343, 245) then Draws a red rectangle at (204, 55) with width 119 and height 85.
; PLAN: r0=343(x), r1=245(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=204(x), r6=55(y), r7=119(width), r8=85(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 245
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 204
LDI r6, 55
LDI r7, 119
LDI r8, 85
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
