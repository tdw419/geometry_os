; DESCRIPTION: Composite: Sets a single orange pixel at (273, 6) then Draws a orange rectangle at (8, 135) with width 54 and height 41.
; PLAN: r0=273(x), r1=6(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=8(x), r6=135(y), r7=54(width), r8=41(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 6
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 8
LDI r6, 135
LDI r7, 54
LDI r8, 41
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
