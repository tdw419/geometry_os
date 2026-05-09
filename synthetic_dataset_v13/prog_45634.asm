; DESCRIPTION: Composite: Draws a purple rectangle at (441, 150) with width 65 and height 104 then Draws a orange line from (412, 8) to (449, 238) then Draws a blue circle centered at (395, 198) with radius 58.
; PLAN: r0=441(x), r1=150(y), r2=65(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x1), r6=8(y1), r7=449(x2), r8=238(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=395(x), r11=198(y), r12=58(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 441
LDI r1, 150
LDI r2, 65
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 8
LDI r7, 449
LDI r8, 238
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 198
LDI r12, 58
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
