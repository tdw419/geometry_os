; DESCRIPTION: Composite: Creates a orange rectangular region at (165, 131) spanning 24 by 15 pixels then Places a blue line segment connecting (245, 104) to (478, 59) then Creates a white circular shape at (155, 52) with radius 49.
; PLAN: r0=165(x), r1=131(y), r2=24(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x1), r6=104(y1), r7=478(x2), r8=59(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=155(x), r11=52(y), r12=49(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 165
LDI r1, 131
LDI r2, 24
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 104
LDI r7, 478
LDI r8, 59
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 52
LDI r12, 49
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
