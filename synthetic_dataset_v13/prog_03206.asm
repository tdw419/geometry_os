; DESCRIPTION: Composite: Sets a single red pixel at (329, 106) then Draws a magenta rectangle at (185, 101) with width 75 and height 110.
; PLAN: r0=329(x), r1=106(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=185(x), r6=101(y), r7=75(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 329
LDI r1, 106
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 185
LDI r6, 101
LDI r7, 75
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
