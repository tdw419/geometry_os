; DESCRIPTION: Composite: Renders a blue box of size 45x84 starting at (245, 118) then Draws a blue line from (136, 164) to (427, 88) then Creates a white circular shape at (96, 198) with radius 24.
; PLAN: r0=245(x), r1=118(y), r2=45(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x1), r6=164(y1), r7=427(x2), r8=88(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=96(x), r11=198(y), r12=24(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 245
LDI r1, 118
LDI r2, 45
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 164
LDI r7, 427
LDI r8, 88
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 198
LDI r12, 24
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
