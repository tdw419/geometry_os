; DESCRIPTION: Composite: Sets a single red pixel at (366, 241) then Draws a red rectangle at (189, 36) with width 60 and height 36.
; PLAN: r0=366(x), r1=241(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=189(x), r6=36(y), r7=60(width), r8=36(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 241
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 189
LDI r6, 36
LDI r7, 60
LDI r8, 36
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
