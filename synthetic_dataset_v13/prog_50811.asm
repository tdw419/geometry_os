; DESCRIPTION: Composite: Draws a orange rectangle at (226, 13) with width 96 and height 103 then Places a purple line segment connecting (190, 189) to (472, 12) then Draws a blue circle centered at (404, 59) with radius 53.
; PLAN: r0=226(x), r1=13(y), r2=96(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x1), r6=189(y1), r7=472(x2), r8=12(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=404(x), r11=59(y), r12=53(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 226
LDI r1, 13
LDI r2, 96
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 189
LDI r7, 472
LDI r8, 12
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 404
LDI r11, 59
LDI r12, 53
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
