; DESCRIPTION: Composite: Creates a green circular shape at (474, 176) with radius 29 then Draws a purple rectangle at (145, 224) with width 119 and height 30 then Renders a purple line between points (215, 21) and (237, 123).
; PLAN: r0=474(x), r1=176(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=145(x), r6=224(y), r7=119(width), r8=30(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=215(x1), r11=21(y1), r12=237(x2), r13=123(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 474
LDI r1, 176
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 145
LDI r6, 224
LDI r7, 119
LDI r8, 30
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 21
LDI r12, 237
LDI r13, 123
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
