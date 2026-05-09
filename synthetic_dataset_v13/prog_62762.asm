; DESCRIPTION: Composite: Renders a blue disk with center (133, 83) and radius 53 then Draws a black rectangle at (230, 100) with width 62 and height 91 then Draws a magenta line from (58, 155) to (187, 41).
; PLAN: r0=133(x), r1=83(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=230(x), r6=100(y), r7=62(width), r8=91(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=58(x1), r11=155(y1), r12=187(x2), r13=41(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 83
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 230
LDI r6, 100
LDI r7, 62
LDI r8, 91
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 58
LDI r11, 155
LDI r12, 187
LDI r13, 41
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
