; DESCRIPTION: Composite: Renders a blue box of size 88x89 starting at (37, 105) then Draws a yellow line from (165, 10) to (158, 93) then Renders a green disk with center (200, 115) and radius 30.
; PLAN: r0=37(x), r1=105(y), r2=88(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=165(x1), r6=10(y1), r7=158(x2), r8=93(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=200(x), r11=115(y), r12=30(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 37
LDI r1, 105
LDI r2, 88
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 10
LDI r7, 158
LDI r8, 93
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 115
LDI r12, 30
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
