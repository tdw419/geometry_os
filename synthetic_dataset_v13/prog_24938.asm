; DESCRIPTION: Composite: Sets a single red pixel at (472, 203) then Draws a magenta rectangle at (498, 87) with width 12 and height 117.
; PLAN: r0=472(x), r1=203(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=498(x), r6=87(y), r7=12(width), r8=117(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 472
LDI r1, 203
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 498
LDI r6, 87
LDI r7, 12
LDI r8, 117
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
