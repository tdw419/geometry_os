; DESCRIPTION: Composite: Draws a blue rectangle at (363, 73) with width 118 and height 96 then Places a orange line segment connecting (167, 75) to (121, 142) then Places a orange dot at position (354, 156).
; PLAN: r0=363(x), r1=73(y), r2=118(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=167(x1), r6=75(y1), r7=121(x2), r8=142(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=354(x), r11=156(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 363
LDI r1, 73
LDI r2, 118
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 75
LDI r7, 121
LDI r8, 142
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 156
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
