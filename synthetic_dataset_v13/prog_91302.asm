; DESCRIPTION: Composite: Draws a green rectangle at (314, 167) with width 110 and height 76 then Places a cyan dot at position (162, 67).
; PLAN: r0=314(x), r1=167(y), r2=110(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=162(x), r6=67(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 314
LDI r1, 167
LDI r2, 110
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 67
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
