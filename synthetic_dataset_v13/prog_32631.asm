; DESCRIPTION: Composite: Draws a green rectangle at (88, 70) with width 80 and height 106 then Renders a purple line between points (457, 25) and (330, 126).
; PLAN: r0=88(x), r1=70(y), r2=80(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x1), r6=25(y1), r7=330(x2), r8=126(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 70
LDI r2, 80
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 25
LDI r7, 330
LDI r8, 126
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
