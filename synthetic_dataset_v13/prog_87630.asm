; DESCRIPTION: Composite: Places a orange dot at position (84, 62) then Draws a orange rectangle at (162, 144) with width 25 and height 94.
; PLAN: r0=84(x), r1=62(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=162(x), r6=144(y), r7=25(width), r8=94(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 62
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 162
LDI r6, 144
LDI r7, 25
LDI r8, 94
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
