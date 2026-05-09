; DESCRIPTION: Composite: Places a white dot at position (203, 194) then Draws a purple rectangle at (24, 20) with width 89 and height 63.
; PLAN: r0=203(x), r1=194(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=24(x), r6=20(y), r7=89(width), r8=63(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 194
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 24
LDI r6, 20
LDI r7, 89
LDI r8, 63
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
