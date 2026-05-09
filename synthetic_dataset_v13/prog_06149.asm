; DESCRIPTION: Composite: Draws a purple rectangle at (8, 81) with width 18 and height 62 then Draws a black line from (72, 19) to (327, 230) then Draws a blue circle centered at (150, 58) with radius 55.
; PLAN: r0=8(x), r1=81(y), r2=18(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x1), r6=19(y1), r7=327(x2), r8=230(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=150(x), r11=58(y), r12=55(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 8
LDI r1, 81
LDI r2, 18
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 19
LDI r7, 327
LDI r8, 230
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 58
LDI r12, 55
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
