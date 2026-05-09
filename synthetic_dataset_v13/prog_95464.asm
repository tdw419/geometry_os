; DESCRIPTION: Composite: Draws a purple rectangle at (248, 116) with width 73 and height 102 then Places a blue circle of radius 28 at center (62, 81) then Places a magenta line segment connecting (19, 68) to (398, 147).
; PLAN: r0=248(x), r1=116(y), r2=73(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=62(x), r6=81(y), r7=28(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=19(x1), r11=68(y1), r12=398(x2), r13=147(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 116
LDI r2, 73
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 81
LDI r7, 28
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 19
LDI r11, 68
LDI r12, 398
LDI r13, 147
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
