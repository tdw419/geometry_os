; DESCRIPTION: Composite: Sets a single black pixel at (427, 74) then Draws a black rectangle at (166, 120) with width 119 and height 80.
; PLAN: r0=427(x), r1=74(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=120(y), r7=119(width), r8=80(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 74
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 166
LDI r6, 120
LDI r7, 119
LDI r8, 80
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
