; DESCRIPTION: Composite: Draws a red circle centered at (396, 52) with radius 48 then Renders a blue box of size 24x88 starting at (61, 123) then Places a white line segment connecting (208, 68) to (172, 98).
; PLAN: r0=396(x), r1=52(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=61(x), r6=123(y), r7=24(width), r8=88(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x1), r11=68(y1), r12=172(x2), r13=98(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 52
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 61
LDI r6, 123
LDI r7, 24
LDI r8, 88
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 68
LDI r12, 172
LDI r13, 98
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
