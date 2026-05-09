; DESCRIPTION: Composite: Draws a yellow line from (475, 162) to (34, 175) then Creates a magenta rectangular region at (0, 48) spanning 119 by 84 pixels then Draws a red circle centered at (379, 51) with radius 41.
; PLAN: r0=475(x1), r1=162(y1), r2=34(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=0(x), r6=48(y), r7=119(width), r8=84(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=379(x), r11=51(y), r12=41(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 475
LDI r1, 162
LDI r2, 34
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 48
LDI r7, 119
LDI r8, 84
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 51
LDI r12, 41
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
