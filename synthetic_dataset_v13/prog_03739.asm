; DESCRIPTION: Composite: Draws a blue line from (389, 175) to (356, 67) then Draws a orange circle centered at (43, 125) with radius 41 then Renders a orange box of size 107x97 starting at (88, 5).
; PLAN: r0=389(x1), r1=175(y1), r2=356(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=125(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=88(x), r11=5(y), r12=107(width), r13=97(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 389
LDI r1, 175
LDI r2, 356
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 125
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 88
LDI r11, 5
LDI r12, 107
LDI r13, 97
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
