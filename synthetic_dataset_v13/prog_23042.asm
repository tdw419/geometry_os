; DESCRIPTION: Composite: Sets a single black pixel at (52, 123) then Draws a red rectangle at (320, 109) with width 81 and height 101.
; PLAN: r0=52(x), r1=123(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=320(x), r6=109(y), r7=81(width), r8=101(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 52
LDI r1, 123
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 320
LDI r6, 109
LDI r7, 81
LDI r8, 101
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
