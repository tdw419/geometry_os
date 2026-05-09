; DESCRIPTION: Composite: Renders a black line between points (385, 143) and (204, 245) then Renders a orange box of size 85x99 starting at (383, 110) then Draws a blue circle centered at (88, 136) with radius 54.
; PLAN: r0=385(x1), r1=143(y1), r2=204(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=110(y), r7=85(width), r8=99(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=88(x), r11=136(y), r12=54(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 385
LDI r1, 143
LDI r2, 204
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 110
LDI r7, 85
LDI r8, 99
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 136
LDI r12, 54
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
