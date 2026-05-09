; DESCRIPTION: Composite: Draws a purple rectangle at (235, 14) with width 10 and height 118 then Renders a white line between points (430, 118) and (54, 188).
; PLAN: r0=235(x), r1=14(y), r2=10(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x1), r6=118(y1), r7=54(x2), r8=188(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 14
LDI r2, 10
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 118
LDI r7, 54
LDI r8, 188
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
