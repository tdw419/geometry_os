; DESCRIPTION: Composite: Places a cyan dot at position (500, 75) then Draws a magenta rectangle at (132, 138) with width 11 and height 37.
; PLAN: r0=500(x), r1=75(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=132(x), r6=138(y), r7=11(width), r8=37(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 500
LDI r1, 75
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 132
LDI r6, 138
LDI r7, 11
LDI r8, 37
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
