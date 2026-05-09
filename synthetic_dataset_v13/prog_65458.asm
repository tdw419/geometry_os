; DESCRIPTION: Composite: Draws a orange rectangle at (209, 76) with width 106 and height 108 then Places a white dot at position (287, 118).
; PLAN: r0=209(x), r1=76(y), r2=106(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x), r6=118(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 209
LDI r1, 76
LDI r2, 106
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 118
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
