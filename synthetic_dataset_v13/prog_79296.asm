; DESCRIPTION: Composite: Renders a orange disk with center (377, 155) and radius 77 then Draws a black rectangle at (176, 124) with width 46 and height 76 then Renders a red line between points (290, 60) and (252, 123).
; PLAN: r0=377(x), r1=155(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=176(x), r6=124(y), r7=46(width), r8=76(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=290(x1), r11=60(y1), r12=252(x2), r13=123(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 155
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 176
LDI r6, 124
LDI r7, 46
LDI r8, 76
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 60
LDI r12, 252
LDI r13, 123
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
