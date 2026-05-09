; DESCRIPTION: Composite: Creates a red rectangular region at (153, 145) spanning 83 by 91 pixels then Places a orange circle of radius 67 at center (396, 148) then Renders a black line between points (250, 120) and (328, 181).
; PLAN: r0=153(x), r1=145(y), r2=83(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=396(x), r6=148(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=250(x1), r11=120(y1), r12=328(x2), r13=181(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 145
LDI r2, 83
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 148
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 250
LDI r11, 120
LDI r12, 328
LDI r13, 181
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
