; DESCRIPTION: Composite: Draws a purple circle centered at (170, 178) with radius 54 then Places a green line segment connecting (311, 186) to (95, 17) then Draws a blue rectangle at (22, 41) with width 29 and height 15.
; PLAN: r0=170(x), r1=178(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x1), r6=186(y1), r7=95(x2), r8=17(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=22(x), r11=41(y), r12=29(width), r13=15(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 170
LDI r1, 178
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 186
LDI r7, 95
LDI r8, 17
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 22
LDI r11, 41
LDI r12, 29
LDI r13, 15
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
