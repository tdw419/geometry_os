; DESCRIPTION: Composite: Places a yellow circle of radius 38 at center (181, 207) then Renders a purple line between points (407, 219) and (176, 116) then Draws a green rectangle at (70, 12) with width 119 and height 43.
; PLAN: r0=181(x), r1=207(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=407(x1), r6=219(y1), r7=176(x2), r8=116(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=70(x), r11=12(y), r12=119(width), r13=43(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 181
LDI r1, 207
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 407
LDI r6, 219
LDI r7, 176
LDI r8, 116
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 12
LDI r12, 119
LDI r13, 43
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
