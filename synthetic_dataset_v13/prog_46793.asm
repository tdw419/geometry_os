; DESCRIPTION: Composite: Places a orange line segment connecting (459, 203) to (492, 36) then Places a white dot at position (309, 101) then Draws a green rectangle at (390, 2) with width 40 and height 65.
; PLAN: r0=459(x1), r1=203(y1), r2=492(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=309(x), r6=101(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=390(x), r11=2(y), r12=40(width), r13=65(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 203
LDI r2, 492
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 101
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 390
LDI r11, 2
LDI r12, 40
LDI r13, 65
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
