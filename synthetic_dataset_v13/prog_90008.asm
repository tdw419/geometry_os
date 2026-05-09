; DESCRIPTION: Composite: Renders a black disk with center (424, 168) and radius 35 then Draws a blue rectangle at (356, 113) with width 79 and height 34 then Places a purple line segment connecting (212, 79) to (396, 131).
; PLAN: r0=424(x), r1=168(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x), r6=113(y), r7=79(width), r8=34(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=212(x1), r11=79(y1), r12=396(x2), r13=131(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 168
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 113
LDI r7, 79
LDI r8, 34
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 79
LDI r12, 396
LDI r13, 131
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
