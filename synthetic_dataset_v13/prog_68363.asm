; DESCRIPTION: Composite: Places a magenta line segment connecting (23, 8) to (474, 240) then Places a red circle of radius 19 at center (472, 49) then Renders a blue box of size 115x17 starting at (351, 13).
; PLAN: r0=23(x1), r1=8(y1), r2=474(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=472(x), r6=49(y), r7=19(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=351(x), r11=13(y), r12=115(width), r13=17(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 23
LDI r1, 8
LDI r2, 474
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 49
LDI r7, 19
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 351
LDI r11, 13
LDI r12, 115
LDI r13, 17
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
