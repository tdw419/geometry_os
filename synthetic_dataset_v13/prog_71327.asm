; DESCRIPTION: Composite: Renders a red box of size 118x110 starting at (8, 129) then Draws a yellow line from (67, 81) to (65, 49) then Draws a orange circle centered at (86, 183) with radius 43.
; PLAN: r0=8(x), r1=129(y), r2=118(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=67(x1), r6=81(y1), r7=65(x2), r8=49(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=86(x), r11=183(y), r12=43(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 8
LDI r1, 129
LDI r2, 118
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 81
LDI r7, 65
LDI r8, 49
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 183
LDI r12, 43
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
