; DESCRIPTION: Composite: Draws a purple rectangle at (159, 1) with width 116 and height 88 then Draws a orange line from (467, 31) to (261, 135) then Places a magenta dot at position (93, 205).
; PLAN: r0=159(x), r1=1(y), r2=116(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x1), r6=31(y1), r7=261(x2), r8=135(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=93(x), r11=205(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 159
LDI r1, 1
LDI r2, 116
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 31
LDI r7, 261
LDI r8, 135
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 205
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
