; DESCRIPTION: Composite: Draws a orange rectangle at (108, 170) with width 66 and height 40 then Renders a purple disk with center (58, 156) and radius 16 then Places a white line segment connecting (137, 116) to (461, 253).
; PLAN: r0=108(x), r1=170(y), r2=66(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x), r6=156(y), r7=16(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=137(x1), r11=116(y1), r12=461(x2), r13=253(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 170
LDI r2, 66
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 156
LDI r7, 16
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 137
LDI r11, 116
LDI r12, 461
LDI r13, 253
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
