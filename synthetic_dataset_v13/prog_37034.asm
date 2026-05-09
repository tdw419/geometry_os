; DESCRIPTION: Composite: Draws a green rectangle at (348, 162) with width 45 and height 48 then Places a orange line segment connecting (70, 110) to (324, 88) then Draws a black circle centered at (310, 72) with radius 59.
; PLAN: r0=348(x), r1=162(y), r2=45(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=70(x1), r6=110(y1), r7=324(x2), r8=88(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=72(y), r12=59(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 348
LDI r1, 162
LDI r2, 45
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 110
LDI r7, 324
LDI r8, 88
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 72
LDI r12, 59
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
