; DESCRIPTION: Composite: Draws a purple circle centered at (32, 72) with radius 17 then Renders a blue box of size 100x110 starting at (376, 88) then Places a yellow line segment connecting (69, 98) to (486, 221).
; PLAN: r0=32(x), r1=72(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=88(y), r7=100(width), r8=110(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=69(x1), r11=98(y1), r12=486(x2), r13=221(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 72
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 88
LDI r7, 100
LDI r8, 110
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 98
LDI r12, 486
LDI r13, 221
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
