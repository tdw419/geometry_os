; DESCRIPTION: Composite: Places a red dot at position (468, 84) then Draws a blue rectangle at (155, 84) with width 23 and height 18.
; PLAN: r0=468(x), r1=84(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=155(x), r6=84(y), r7=23(width), r8=18(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 468
LDI r1, 84
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 155
LDI r6, 84
LDI r7, 23
LDI r8, 18
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
