; DESCRIPTION: Composite: Renders a orange disk with center (237, 99) and radius 66 then Places a red line segment connecting (304, 141) to (131, 41) then Draws a green rectangle at (396, 24) with width 11 and height 56.
; PLAN: r0=237(x), r1=99(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=304(x1), r6=141(y1), r7=131(x2), r8=41(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=396(x), r11=24(y), r12=11(width), r13=56(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 99
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 304
LDI r6, 141
LDI r7, 131
LDI r8, 41
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 24
LDI r12, 11
LDI r13, 56
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
