; DESCRIPTION: Composite: Renders a white disk with center (110, 188) and radius 34 then Places a orange line segment connecting (375, 93) to (117, 124) then Draws a white rectangle at (334, 198) with width 50 and height 36.
; PLAN: r0=110(x), r1=188(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=375(x1), r6=93(y1), r7=117(x2), r8=124(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=334(x), r11=198(y), r12=50(width), r13=36(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 110
LDI r1, 188
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 375
LDI r6, 93
LDI r7, 117
LDI r8, 124
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 198
LDI r12, 50
LDI r13, 36
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
