; DESCRIPTION: Composite: Draws a red circle centered at (395, 104) with radius 41 then Places a purple line segment connecting (31, 41) to (31, 136) then Draws a magenta rectangle at (170, 52) with width 64 and height 34.
; PLAN: r0=395(x), r1=104(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x1), r6=41(y1), r7=31(x2), r8=136(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=170(x), r11=52(y), r12=64(width), r13=34(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 104
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 41
LDI r7, 31
LDI r8, 136
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 52
LDI r12, 64
LDI r13, 34
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
