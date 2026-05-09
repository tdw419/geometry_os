; DESCRIPTION: Composite: Renders a black disk with center (79, 176) and radius 41 then Draws a black rectangle at (359, 21) with width 89 and height 67 then Places a blue line segment connecting (435, 222) to (503, 130).
; PLAN: r0=79(x), r1=176(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=359(x), r6=21(y), r7=89(width), r8=67(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=435(x1), r11=222(y1), r12=503(x2), r13=130(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 79
LDI r1, 176
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 359
LDI r6, 21
LDI r7, 89
LDI r8, 67
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 222
LDI r12, 503
LDI r13, 130
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
