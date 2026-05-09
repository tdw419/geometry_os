; DESCRIPTION: Composite: Draws a purple line from (139, 28) to (111, 34) then Creates a yellow rectangular region at (327, 138) spanning 40 by 18 pixels then Draws a yellow circle centered at (219, 109) with radius 75.
; PLAN: r0=139(x1), r1=28(y1), r2=111(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=138(y), r7=40(width), r8=18(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=219(x), r11=109(y), r12=75(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 139
LDI r1, 28
LDI r2, 111
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 138
LDI r7, 40
LDI r8, 18
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 109
LDI r12, 75
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
