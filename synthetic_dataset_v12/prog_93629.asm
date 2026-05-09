; DESCRIPTION: Composite: Draws a yellow rectangle at (454, 142) with width 38 and height 83 then Places a purple line segment connecting (41, 150) to (318, 242) then Renders a green disk with center (123, 78) and radius 68.
; PLAN: r0=454(x), r1=142(y), r2=38(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=41(x1), r6=150(y1), r7=318(x2), r8=242(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=123(x), r11=78(y), r12=68(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 454
LDI r1, 142
LDI r2, 38
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 150
LDI r7, 318
LDI r8, 242
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 78
LDI r12, 68
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
