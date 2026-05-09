; DESCRIPTION: Composite: Renders a black line between points (226, 156) and (395, 63) then Places a red 17x38 rectangle at position (476, 173) then Places a blue circle of radius 69 at center (434, 163).
; PLAN: r0=226(x1), r1=156(y1), r2=395(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=476(x), r6=173(y), r7=17(width), r8=38(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=434(x), r11=163(y), r12=69(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 226
LDI r1, 156
LDI r2, 395
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 173
LDI r7, 17
LDI r8, 38
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 163
LDI r12, 69
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
