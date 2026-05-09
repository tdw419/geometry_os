; DESCRIPTION: Composite: Draws a yellow rectangle at (402, 125) with width 70 and height 72 then Places a orange line segment connecting (205, 175) to (339, 27) then Renders a white disk with center (184, 86) and radius 69.
; PLAN: r0=402(x), r1=125(y), r2=70(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=205(x1), r6=175(y1), r7=339(x2), r8=27(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=184(x), r11=86(y), r12=69(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 402
LDI r1, 125
LDI r2, 70
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 175
LDI r7, 339
LDI r8, 27
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 86
LDI r12, 69
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
