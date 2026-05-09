; DESCRIPTION: Composite: Draws a black rectangle at (337, 89) with width 58 and height 28 then Draws a red line from (278, 46) to (484, 163) then Creates a white circular shape at (62, 29) with radius 12.
; PLAN: r0=337(x), r1=89(y), r2=58(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x1), r6=46(y1), r7=484(x2), r8=163(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=62(x), r11=29(y), r12=12(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 337
LDI r1, 89
LDI r2, 58
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 46
LDI r7, 484
LDI r8, 163
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 29
LDI r12, 12
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
