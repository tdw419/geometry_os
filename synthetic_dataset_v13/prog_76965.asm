; DESCRIPTION: Composite: Sets a single white pixel at (318, 149) then Draws a purple rectangle at (207, 55) with width 84 and height 81.
; PLAN: r0=318(x), r1=149(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=55(y), r7=84(width), r8=81(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 149
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 207
LDI r6, 55
LDI r7, 84
LDI r8, 81
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
