; DESCRIPTION: Composite: Renders a purple line between points (376, 203) and (493, 102) then Creates a white circular shape at (86, 172) with radius 25.
; PLAN: r0=376(x1), r1=203(y1), r2=493(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=172(y), r7=25(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 376
LDI r1, 203
LDI r2, 493
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 172
LDI r7, 25
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
