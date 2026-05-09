; DESCRIPTION: Composite: Draws a purple circle centered at (101, 191) with radius 38 then Places a yellow line segment connecting (332, 137) to (355, 144) then Draws a purple rectangle at (340, 89) with width 72 and height 67.
; PLAN: r0=101(x), r1=191(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x1), r6=137(y1), r7=355(x2), r8=144(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=340(x), r11=89(y), r12=72(width), r13=67(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 101
LDI r1, 191
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 137
LDI r7, 355
LDI r8, 144
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 89
LDI r12, 72
LDI r13, 67
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
