; DESCRIPTION: Composite: Draws a purple rectangle at (249, 167) with width 89 and height 68 then Places a orange line segment connecting (201, 66) to (12, 182) then Places a red dot at position (148, 138).
; PLAN: r0=249(x), r1=167(y), r2=89(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x1), r6=66(y1), r7=12(x2), r8=182(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=148(x), r11=138(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 249
LDI r1, 167
LDI r2, 89
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 66
LDI r7, 12
LDI r8, 182
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 138
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
