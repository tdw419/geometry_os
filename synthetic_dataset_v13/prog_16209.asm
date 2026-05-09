; DESCRIPTION: Composite: Places a green dot at position (452, 185) then Draws a purple rectangle at (185, 25) with width 39 and height 118.
; PLAN: r0=452(x), r1=185(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=185(x), r6=25(y), r7=39(width), r8=118(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 452
LDI r1, 185
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 185
LDI r6, 25
LDI r7, 39
LDI r8, 118
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
