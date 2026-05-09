; DESCRIPTION: Composite: Creates a yellow rectangular region at (341, 18) spanning 103 by 118 pixels then Creates a black circular shape at (476, 117) with radius 32 then Draws a purple line from (424, 126) to (179, 10).
; PLAN: r0=341(x), r1=18(y), r2=103(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=476(x), r6=117(y), r7=32(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=424(x1), r11=126(y1), r12=179(x2), r13=10(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 18
LDI r2, 103
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 117
LDI r7, 32
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 424
LDI r11, 126
LDI r12, 179
LDI r13, 10
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
