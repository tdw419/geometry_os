; DESCRIPTION: Composite: Draws a purple circle centered at (189, 139) with radius 62 then Renders a blue line between points (303, 43) and (459, 244) then Draws a green rectangle at (269, 92) with width 110 and height 41.
; PLAN: r0=189(x), r1=139(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=303(x1), r6=43(y1), r7=459(x2), r8=244(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=269(x), r11=92(y), r12=110(width), r13=41(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 189
LDI r1, 139
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 303
LDI r6, 43
LDI r7, 459
LDI r8, 244
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 92
LDI r12, 110
LDI r13, 41
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
