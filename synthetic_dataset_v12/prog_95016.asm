; DESCRIPTION: Composite: Draws a magenta line from (253, 155) to (491, 29) then Renders a yellow disk with center (161, 78) and radius 23 then Creates a white rectangular region at (390, 53) spanning 93 by 82 pixels.
; PLAN: r0=253(x1), r1=155(y1), r2=491(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=78(y), r7=23(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=390(x), r11=53(y), r12=93(width), r13=82(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 155
LDI r2, 491
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 78
LDI r7, 23
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 390
LDI r11, 53
LDI r12, 93
LDI r13, 82
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
