; DESCRIPTION: Composite: Places a blue dot at position (230, 77) then Draws a green rectangle at (127, 33) with width 85 and height 118.
; PLAN: r0=230(x), r1=77(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=33(y), r7=85(width), r8=118(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 230
LDI r1, 77
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 127
LDI r6, 33
LDI r7, 85
LDI r8, 118
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
