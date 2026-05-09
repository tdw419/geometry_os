; DESCRIPTION: Composite: Creates a purple rectangular region at (99, 114) spanning 22 by 106 pixels then Draws a red circle centered at (465, 64) with radius 43 then Draws a black line from (214, 237) to (140, 118).
; PLAN: r0=99(x), r1=114(y), r2=22(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x), r6=64(y), r7=43(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=214(x1), r11=237(y1), r12=140(x2), r13=118(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 99
LDI r1, 114
LDI r2, 22
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 64
LDI r7, 43
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 214
LDI r11, 237
LDI r12, 140
LDI r13, 118
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
