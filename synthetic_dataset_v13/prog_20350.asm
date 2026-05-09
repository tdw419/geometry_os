; DESCRIPTION: Composite: Draws a black rectangle at (204, 190) with width 23 and height 66 then Places a red line segment connecting (410, 77) to (115, 149) then Places a purple circle of radius 75 at center (369, 90).
; PLAN: r0=204(x), r1=190(y), r2=23(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x1), r6=77(y1), r7=115(x2), r8=149(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=369(x), r11=90(y), r12=75(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 204
LDI r1, 190
LDI r2, 23
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 77
LDI r7, 115
LDI r8, 149
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 90
LDI r12, 75
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
