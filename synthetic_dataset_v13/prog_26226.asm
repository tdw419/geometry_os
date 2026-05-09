; DESCRIPTION: Composite: Sets a single red pixel at (55, 100) then Draws a cyan rectangle at (311, 100) with width 73 and height 96.
; PLAN: r0=55(x), r1=100(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=100(y), r7=73(width), r8=96(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 55
LDI r1, 100
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 311
LDI r6, 100
LDI r7, 73
LDI r8, 96
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
