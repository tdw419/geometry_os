; DESCRIPTION: Composite: Sets a single orange pixel at (118, 190) then Draws a green rectangle at (46, 18) with width 88 and height 48.
; PLAN: r0=118(x), r1=190(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=46(x), r6=18(y), r7=88(width), r8=48(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 118
LDI r1, 190
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 46
LDI r6, 18
LDI r7, 88
LDI r8, 48
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
