; DESCRIPTION: Composite: Renders a purple disk with center (155, 205) and radius 17 then Renders a blue box of size 37x53 starting at (310, 145) then Draws a yellow line from (259, 147) to (264, 165).
; PLAN: r0=155(x), r1=205(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=310(x), r6=145(y), r7=37(width), r8=53(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=259(x1), r11=147(y1), r12=264(x2), r13=165(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 205
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 310
LDI r6, 145
LDI r7, 37
LDI r8, 53
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 147
LDI r12, 264
LDI r13, 165
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
