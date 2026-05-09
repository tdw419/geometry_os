; DESCRIPTION: Composite: Draws a purple line from (49, 159) to (181, 114) then Draws a purple rectangle at (489, 200) with width 13 and height 52.
; PLAN: r0=49(x1), r1=159(y1), r2=181(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=489(x), r6=200(y), r7=13(width), r8=52(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 49
LDI r1, 159
LDI r2, 181
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 200
LDI r7, 13
LDI r8, 52
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
