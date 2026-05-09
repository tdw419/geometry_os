; DESCRIPTION: Composite: Sets a single black pixel at (318, 141) then Draws a blue rectangle at (203, 119) with width 74 and height 90.
; PLAN: r0=318(x), r1=141(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=203(x), r6=119(y), r7=74(width), r8=90(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 141
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 203
LDI r6, 119
LDI r7, 74
LDI r8, 90
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
