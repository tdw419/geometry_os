; DESCRIPTION: Composite: Draws a black circle centered at (347, 134) with radius 16 then Creates a black rectangular region at (142, 99) spanning 22 by 72 pixels then Renders a blue line between points (298, 60) and (232, 127).
; PLAN: r0=347(x), r1=134(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=142(x), r6=99(y), r7=22(width), r8=72(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=298(x1), r11=60(y1), r12=232(x2), r13=127(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 134
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 142
LDI r6, 99
LDI r7, 22
LDI r8, 72
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 298
LDI r11, 60
LDI r12, 232
LDI r13, 127
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
