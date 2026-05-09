; DESCRIPTION: Composite: Draws a red rectangle at (6, 4) with width 55 and height 106 then Places a purple line segment connecting (181, 248) to (107, 79).
; PLAN: r0=6(x), r1=4(y), r2=55(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=181(x1), r6=248(y1), r7=107(x2), r8=79(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 6
LDI r1, 4
LDI r2, 55
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 248
LDI r7, 107
LDI r8, 79
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
