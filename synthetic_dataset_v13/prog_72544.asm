; DESCRIPTION: Composite: Draws a black rectangle at (318, 48) with width 20 and height 64 then Draws a black circle centered at (307, 173) with radius 58 then Draws a black line from (484, 205) to (310, 179).
; PLAN: r0=318(x), r1=48(y), r2=20(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x), r6=173(y), r7=58(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=484(x1), r11=205(y1), r12=310(x2), r13=179(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 48
LDI r2, 20
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 173
LDI r7, 58
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 484
LDI r11, 205
LDI r12, 310
LDI r13, 179
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
