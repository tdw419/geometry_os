; DESCRIPTION: Composite: Creates a black rectangular region at (249, 13) spanning 103 by 106 pixels then Renders a blue disk with center (348, 178) and radius 55 then Renders a yellow line between points (137, 134) and (383, 101).
; PLAN: r0=249(x), r1=13(y), r2=103(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x), r6=178(y), r7=55(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=137(x1), r11=134(y1), r12=383(x2), r13=101(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 13
LDI r2, 103
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 178
LDI r7, 55
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 137
LDI r11, 134
LDI r12, 383
LDI r13, 101
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
