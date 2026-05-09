; DESCRIPTION: Composite: Draws a purple rectangle at (221, 87) with width 85 and height 20 then Draws a blue line from (207, 134) to (88, 118) then Places a yellow circle of radius 25 at center (329, 34).
; PLAN: r0=221(x), r1=87(y), r2=85(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x1), r6=134(y1), r7=88(x2), r8=118(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=329(x), r11=34(y), r12=25(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 221
LDI r1, 87
LDI r2, 85
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 134
LDI r7, 88
LDI r8, 118
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 34
LDI r12, 25
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
