; DESCRIPTION: Composite: Renders a black line between points (144, 114) and (325, 133) then Draws a green rectangle at (316, 17) with width 13 and height 48 then Draws a purple circle centered at (153, 215) with radius 13.
; PLAN: r0=144(x1), r1=114(y1), r2=325(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=17(y), r7=13(width), r8=48(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=153(x), r11=215(y), r12=13(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 144
LDI r1, 114
LDI r2, 325
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 17
LDI r7, 13
LDI r8, 48
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 215
LDI r12, 13
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
