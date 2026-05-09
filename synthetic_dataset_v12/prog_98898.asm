; DESCRIPTION: Composite: Places a yellow circle of radius 55 at center (380, 122) then Draws a orange rectangle at (7, 41) with width 105 and height 19 then Draws a magenta line from (416, 155) to (91, 224).
; PLAN: r0=380(x), r1=122(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=7(x), r6=41(y), r7=105(width), r8=19(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=416(x1), r11=155(y1), r12=91(x2), r13=224(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 122
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 7
LDI r6, 41
LDI r7, 105
LDI r8, 19
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 416
LDI r11, 155
LDI r12, 91
LDI r13, 224
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
