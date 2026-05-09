; DESCRIPTION: Composite: Places a orange dot at position (309, 136) then Draws a magenta rectangle at (152, 102) with width 11 and height 40.
; PLAN: r0=309(x), r1=136(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=152(x), r6=102(y), r7=11(width), r8=40(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 136
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 152
LDI r6, 102
LDI r7, 11
LDI r8, 40
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
