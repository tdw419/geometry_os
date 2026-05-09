; DESCRIPTION: Composite: Places a red line segment connecting (91, 177) to (139, 87) then Draws a orange rectangle at (179, 101) with width 37 and height 17 then Renders a blue disk with center (377, 81) and radius 31.
; PLAN: r0=91(x1), r1=177(y1), r2=139(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=101(y), r7=37(width), r8=17(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=377(x), r11=81(y), r12=31(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 91
LDI r1, 177
LDI r2, 139
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 101
LDI r7, 37
LDI r8, 17
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 377
LDI r11, 81
LDI r12, 31
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
