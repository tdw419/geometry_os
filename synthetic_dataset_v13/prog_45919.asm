; DESCRIPTION: Composite: Renders a purple line between points (483, 40) and (139, 186) then Draws a green rectangle at (282, 159) with width 106 and height 36.
; PLAN: r0=483(x1), r1=40(y1), r2=139(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=159(y), r7=106(width), r8=36(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 483
LDI r1, 40
LDI r2, 139
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 159
LDI r7, 106
LDI r8, 36
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
