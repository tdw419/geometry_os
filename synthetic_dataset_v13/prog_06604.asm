; DESCRIPTION: Composite: Draws a green circle centered at (186, 154) with radius 46 then Draws a purple line from (203, 80) to (270, 238) then Draws a purple rectangle at (157, 28) with width 76 and height 21.
; PLAN: r0=186(x), r1=154(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=203(x1), r6=80(y1), r7=270(x2), r8=238(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=157(x), r11=28(y), r12=76(width), r13=21(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 186
LDI r1, 154
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 203
LDI r6, 80
LDI r7, 270
LDI r8, 238
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 28
LDI r12, 76
LDI r13, 21
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
