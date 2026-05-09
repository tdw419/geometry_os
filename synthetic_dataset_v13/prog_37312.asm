; DESCRIPTION: Composite: Draws a yellow line from (288, 26) to (436, 200) then Draws a yellow circle centered at (191, 149) with radius 38 then Creates a orange rectangular region at (136, 142) spanning 79 by 49 pixels.
; PLAN: r0=288(x1), r1=26(y1), r2=436(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=149(y), r7=38(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=136(x), r11=142(y), r12=79(width), r13=49(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 26
LDI r2, 436
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 149
LDI r7, 38
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 136
LDI r11, 142
LDI r12, 79
LDI r13, 49
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
