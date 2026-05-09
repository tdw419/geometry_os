; DESCRIPTION: Composite: Draws a red circle centered at (86, 131) with radius 62 then Draws a white rectangle at (35, 55) with width 77 and height 110 then Places a white line segment connecting (507, 126) to (201, 188).
; PLAN: r0=86(x), r1=131(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x), r6=55(y), r7=77(width), r8=110(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=507(x1), r11=126(y1), r12=201(x2), r13=188(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 131
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 55
LDI r7, 77
LDI r8, 110
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 507
LDI r11, 126
LDI r12, 201
LDI r13, 188
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
