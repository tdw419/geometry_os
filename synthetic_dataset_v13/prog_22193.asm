; DESCRIPTION: Composite: Sets a single yellow pixel at (144, 175) then Renders a green line between points (348, 101) and (155, 203).
; PLAN: r0=144(x), r1=175(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=348(x1), r6=101(y1), r7=155(x2), r8=203(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 175
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 348
LDI r6, 101
LDI r7, 155
LDI r8, 203
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
