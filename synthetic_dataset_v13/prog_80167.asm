; DESCRIPTION: Composite: Places a blue dot at position (311, 92) then Draws a blue rectangle at (438, 80) with width 25 and height 92.
; PLAN: r0=311(x), r1=92(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=438(x), r6=80(y), r7=25(width), r8=92(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 311
LDI r1, 92
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 438
LDI r6, 80
LDI r7, 25
LDI r8, 92
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
