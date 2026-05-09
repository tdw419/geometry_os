; DESCRIPTION: Composite: Places a purple circle of radius 58 at center (355, 61) then Renders a yellow line between points (157, 116) and (347, 237) then Draws a black rectangle at (311, 119) with width 102 and height 67.
; PLAN: r0=355(x), r1=61(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x1), r6=116(y1), r7=347(x2), r8=237(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=311(x), r11=119(y), r12=102(width), r13=67(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 61
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 116
LDI r7, 347
LDI r8, 237
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 119
LDI r12, 102
LDI r13, 67
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
