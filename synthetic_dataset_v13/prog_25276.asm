; DESCRIPTION: Composite: Creates a red rectangular region at (376, 156) spanning 57 by 84 pixels then Draws a white line from (172, 99) to (197, 123) then Draws a magenta circle centered at (331, 127) with radius 22.
; PLAN: r0=376(x), r1=156(y), r2=57(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x1), r6=99(y1), r7=197(x2), r8=123(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=331(x), r11=127(y), r12=22(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 376
LDI r1, 156
LDI r2, 57
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 99
LDI r7, 197
LDI r8, 123
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 127
LDI r12, 22
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
