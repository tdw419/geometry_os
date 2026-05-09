; DESCRIPTION: Composite: Draws a yellow rectangle at (157, 151) with width 80 and height 68 then Creates a green circular shape at (47, 179) with radius 38 then Draws a magenta line from (418, 123) to (101, 6).
; PLAN: r0=157(x), r1=151(y), r2=80(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=47(x), r6=179(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=418(x1), r11=123(y1), r12=101(x2), r13=6(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 157
LDI r1, 151
LDI r2, 80
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 179
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 418
LDI r11, 123
LDI r12, 101
LDI r13, 6
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
