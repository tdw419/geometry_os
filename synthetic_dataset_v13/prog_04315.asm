; DESCRIPTION: Composite: Places a purple dot at position (78, 167) then Draws a green rectangle at (391, 30) with width 96 and height 25.
; PLAN: r0=78(x), r1=167(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=391(x), r6=30(y), r7=96(width), r8=25(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 167
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 391
LDI r6, 30
LDI r7, 96
LDI r8, 25
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
