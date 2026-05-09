; DESCRIPTION: Composite: Draws a magenta circle centered at (217, 165) with radius 78 then Draws a yellow rectangle at (35, 78) with width 103 and height 80 then Places a yellow line segment connecting (501, 133) to (148, 26).
; PLAN: r0=217(x), r1=165(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x), r6=78(y), r7=103(width), r8=80(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=501(x1), r11=133(y1), r12=148(x2), r13=26(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 165
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 78
LDI r7, 103
LDI r8, 80
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 501
LDI r11, 133
LDI r12, 148
LDI r13, 26
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
