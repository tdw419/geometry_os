; DESCRIPTION: Composite: Draws a blue rectangle at (265, 60) with width 91 and height 68 then Places a orange line segment connecting (175, 213) to (125, 204) then Places a black circle of radius 14 at center (334, 55).
; PLAN: r0=265(x), r1=60(y), r2=91(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x1), r6=213(y1), r7=125(x2), r8=204(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=334(x), r11=55(y), r12=14(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 265
LDI r1, 60
LDI r2, 91
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 213
LDI r7, 125
LDI r8, 204
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 55
LDI r12, 14
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
