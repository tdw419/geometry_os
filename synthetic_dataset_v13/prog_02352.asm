; DESCRIPTION: Composite: Places a yellow line segment connecting (364, 13) to (20, 37) then Draws a purple rectangle at (78, 73) with width 81 and height 35 then Renders a purple disk with center (137, 120) and radius 75.
; PLAN: r0=364(x1), r1=13(y1), r2=20(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=78(x), r6=73(y), r7=81(width), r8=35(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=137(x), r11=120(y), r12=75(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 364
LDI r1, 13
LDI r2, 20
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 73
LDI r7, 81
LDI r8, 35
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 120
LDI r12, 75
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
