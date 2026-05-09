; DESCRIPTION: Composite: Draws a orange rectangle at (457, 198) with width 33 and height 13 then Creates a purple circular shape at (408, 48) with radius 35 then Draws a purple line from (455, 86) to (322, 131).
; PLAN: r0=457(x), r1=198(y), r2=33(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x), r6=48(y), r7=35(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=455(x1), r11=86(y1), r12=322(x2), r13=131(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 457
LDI r1, 198
LDI r2, 33
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 48
LDI r7, 35
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 455
LDI r11, 86
LDI r12, 322
LDI r13, 131
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
