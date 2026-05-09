; DESCRIPTION: Composite: Sets a single green pixel at (154, 9) then Draws a cyan rectangle at (30, 29) with width 74 and height 95.
; PLAN: r0=154(x), r1=9(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=30(x), r6=29(y), r7=74(width), r8=95(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 9
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 30
LDI r6, 29
LDI r7, 74
LDI r8, 95
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
