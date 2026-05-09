; DESCRIPTION: Composite: Draws a purple circle centered at (470, 147) with radius 36 then Creates a black rectangular region at (473, 145) spanning 38 by 78 pixels then Renders a white line between points (368, 113) and (128, 183).
; PLAN: r0=470(x), r1=147(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=473(x), r6=145(y), r7=38(width), r8=78(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=368(x1), r11=113(y1), r12=128(x2), r13=183(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 470
LDI r1, 147
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 473
LDI r6, 145
LDI r7, 38
LDI r8, 78
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 113
LDI r12, 128
LDI r13, 183
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
