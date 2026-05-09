; DESCRIPTION: Composite: Draws a green circle centered at (157, 166) with radius 17 then Renders a purple box of size 118x88 starting at (353, 84) then Places a green line segment connecting (235, 188) to (320, 234).
; PLAN: r0=157(x), r1=166(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x), r6=84(y), r7=118(width), r8=88(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=235(x1), r11=188(y1), r12=320(x2), r13=234(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 157
LDI r1, 166
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 84
LDI r7, 118
LDI r8, 88
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 235
LDI r11, 188
LDI r12, 320
LDI r13, 234
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
