; DESCRIPTION: Composite: Renders a orange line between points (163, 79) and (373, 205) then Draws a yellow circle centered at (101, 122) with radius 16 then Draws a magenta rectangle at (334, 33) with width 115 and height 55.
; PLAN: r0=163(x1), r1=79(y1), r2=373(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=101(x), r6=122(y), r7=16(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=334(x), r11=33(y), r12=115(width), r13=55(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 163
LDI r1, 79
LDI r2, 373
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 122
LDI r7, 16
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 334
LDI r11, 33
LDI r12, 115
LDI r13, 55
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
