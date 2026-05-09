; DESCRIPTION: Composite: Draws a purple circle centered at (347, 191) with radius 63 then Renders a purple line between points (155, 8) and (17, 207) then Creates a red rectangular region at (109, 144) spanning 82 by 34 pixels.
; PLAN: r0=347(x), r1=191(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x1), r6=8(y1), r7=17(x2), r8=207(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=109(x), r11=144(y), r12=82(width), r13=34(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 191
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 8
LDI r7, 17
LDI r8, 207
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 109
LDI r11, 144
LDI r12, 82
LDI r13, 34
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
