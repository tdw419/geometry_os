; DESCRIPTION: Composite: Places a orange dot at position (96, 171) then Draws a green rectangle at (230, 25) with width 91 and height 106.
; PLAN: r0=96(x), r1=171(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=25(y), r7=91(width), r8=106(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 171
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 230
LDI r6, 25
LDI r7, 91
LDI r8, 106
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
