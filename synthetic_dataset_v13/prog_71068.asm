; DESCRIPTION: Composite: Creates a red circular shape at (344, 105) with radius 39 then Creates a purple rectangular region at (377, 132) spanning 59 by 96 pixels then Draws a black line from (231, 106) to (234, 157).
; PLAN: r0=344(x), r1=105(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x), r6=132(y), r7=59(width), r8=96(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=231(x1), r11=106(y1), r12=234(x2), r13=157(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 105
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 132
LDI r7, 59
LDI r8, 96
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 231
LDI r11, 106
LDI r12, 234
LDI r13, 157
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
