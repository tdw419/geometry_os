; DESCRIPTION: Composite: Places a black line segment connecting (129, 232) to (438, 59) then Draws a white rectangle at (157, 126) with width 34 and height 104 then Creates a yellow circular shape at (342, 131) with radius 73.
; PLAN: r0=129(x1), r1=232(y1), r2=438(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=126(y), r7=34(width), r8=104(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=342(x), r11=131(y), r12=73(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 129
LDI r1, 232
LDI r2, 438
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 126
LDI r7, 34
LDI r8, 104
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 131
LDI r12, 73
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
