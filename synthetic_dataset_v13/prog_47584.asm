; DESCRIPTION: Composite: Draws a orange line from (487, 156) to (461, 118) then Draws a blue rectangle at (18, 165) with width 97 and height 77 then Places a red dot at position (257, 163).
; PLAN: r0=487(x1), r1=156(y1), r2=461(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=18(x), r6=165(y), r7=97(width), r8=77(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=257(x), r11=163(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 487
LDI r1, 156
LDI r2, 461
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 165
LDI r7, 97
LDI r8, 77
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 163
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
