; DESCRIPTION: Composite: Renders a black disk with center (472, 82) and radius 17 then Creates a magenta rectangular region at (412, 121) spanning 87 by 84 pixels then Renders a white line between points (349, 72) and (229, 133).
; PLAN: r0=472(x), r1=82(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=412(x), r6=121(y), r7=87(width), r8=84(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=349(x1), r11=72(y1), r12=229(x2), r13=133(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 472
LDI r1, 82
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 412
LDI r6, 121
LDI r7, 87
LDI r8, 84
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 349
LDI r11, 72
LDI r12, 229
LDI r13, 133
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
