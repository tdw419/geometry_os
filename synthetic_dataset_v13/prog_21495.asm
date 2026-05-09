; DESCRIPTION: Composite: Places a magenta dot at position (318, 172) then Draws a yellow rectangle at (309, 18) with width 45 and height 105.
; PLAN: r0=318(x), r1=172(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=18(y), r7=45(width), r8=105(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 172
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 309
LDI r6, 18
LDI r7, 45
LDI r8, 105
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
