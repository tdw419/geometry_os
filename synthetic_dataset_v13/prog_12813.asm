; DESCRIPTION: Composite: Draws a purple circle centered at (192, 135) with radius 46 then Draws a orange rectangle at (476, 149) with width 28 and height 24 then Draws a green line from (301, 121) to (322, 145).
; PLAN: r0=192(x), r1=135(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=476(x), r6=149(y), r7=28(width), r8=24(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=301(x1), r11=121(y1), r12=322(x2), r13=145(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 135
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 476
LDI r6, 149
LDI r7, 28
LDI r8, 24
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 121
LDI r12, 322
LDI r13, 145
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
