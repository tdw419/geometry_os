; DESCRIPTION: Composite: Places a purple circle of radius 20 at center (441, 43) then Places a purple line segment connecting (278, 241) to (307, 198) then Draws a red rectangle at (50, 121) with width 46 and height 14.
; PLAN: r0=441(x), r1=43(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x1), r6=241(y1), r7=307(x2), r8=198(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=50(x), r11=121(y), r12=46(width), r13=14(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 441
LDI r1, 43
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 241
LDI r7, 307
LDI r8, 198
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 50
LDI r11, 121
LDI r12, 46
LDI r13, 14
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
