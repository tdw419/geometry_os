; DESCRIPTION: Composite: Draws a red rectangle at (278, 169) with width 25 and height 47 then Draws a yellow line from (444, 0) to (17, 149) then Draws a white circle centered at (164, 153) with radius 69.
; PLAN: r0=278(x), r1=169(y), r2=25(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x1), r6=0(y1), r7=17(x2), r8=149(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=164(x), r11=153(y), r12=69(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 278
LDI r1, 169
LDI r2, 25
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 0
LDI r7, 17
LDI r8, 149
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 153
LDI r12, 69
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
