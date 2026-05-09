; DESCRIPTION: Composite: Sets a single green pixel at (268, 190) then Draws a red rectangle at (79, 167) with width 18 and height 10.
; PLAN: r0=268(x), r1=190(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=79(x), r6=167(y), r7=18(width), r8=10(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 268
LDI r1, 190
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 79
LDI r6, 167
LDI r7, 18
LDI r8, 10
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
