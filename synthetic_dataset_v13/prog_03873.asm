; DESCRIPTION: Composite: Renders a green line between points (304, 137) and (163, 120) then Draws a orange circle centered at (266, 158) with radius 69 then Creates a white rectangular region at (81, 20) spanning 17 by 13 pixels.
; PLAN: r0=304(x1), r1=137(y1), r2=163(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=158(y), r7=69(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=81(x), r11=20(y), r12=17(width), r13=13(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 137
LDI r2, 163
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 158
LDI r7, 69
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 81
LDI r11, 20
LDI r12, 17
LDI r13, 13
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
