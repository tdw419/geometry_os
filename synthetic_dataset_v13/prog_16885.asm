; DESCRIPTION: Composite: Places a yellow line segment connecting (407, 41) to (328, 59) then Draws a orange circle centered at (270, 146) with radius 19 then Draws a green rectangle at (332, 53) with width 94 and height 34.
; PLAN: r0=407(x1), r1=41(y1), r2=328(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=146(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=332(x), r11=53(y), r12=94(width), r13=34(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 407
LDI r1, 41
LDI r2, 328
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 146
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 332
LDI r11, 53
LDI r12, 94
LDI r13, 34
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
