; DESCRIPTION: Composite: Draws a orange line from (489, 104) to (394, 187) then Draws a orange circle centered at (354, 175) with radius 69 then Draws a green rectangle at (43, 33) with width 53 and height 91.
; PLAN: r0=489(x1), r1=104(y1), r2=394(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=354(x), r6=175(y), r7=69(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=43(x), r11=33(y), r12=53(width), r13=91(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 489
LDI r1, 104
LDI r2, 394
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 175
LDI r7, 69
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 43
LDI r11, 33
LDI r12, 53
LDI r13, 91
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
