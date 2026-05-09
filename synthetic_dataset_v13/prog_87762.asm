; DESCRIPTION: Composite: Draws a blue line from (471, 197) to (212, 214) then Creates a magenta rectangular region at (355, 54) spanning 99 by 59 pixels then Draws a black circle centered at (418, 101) with radius 40.
; PLAN: r0=471(x1), r1=197(y1), r2=212(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=54(y), r7=99(width), r8=59(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=418(x), r11=101(y), r12=40(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 471
LDI r1, 197
LDI r2, 212
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 54
LDI r7, 99
LDI r8, 59
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 101
LDI r12, 40
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
