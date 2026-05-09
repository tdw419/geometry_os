; DESCRIPTION: Composite: Draws a yellow rectangle at (41, 87) with width 44 and height 91 then Creates a purple circular shape at (282, 170) with radius 43 then Places a blue line segment connecting (38, 52) to (290, 239).
; PLAN: r0=41(x), r1=87(y), r2=44(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=282(x), r6=170(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=38(x1), r11=52(y1), r12=290(x2), r13=239(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 41
LDI r1, 87
LDI r2, 44
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 170
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 38
LDI r11, 52
LDI r12, 290
LDI r13, 239
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
