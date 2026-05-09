; DESCRIPTION: Composite: Creates a green rectangular region at (155, 246) spanning 84 by 10 pixels then Places a white line segment connecting (391, 218) to (210, 174) then Creates a yellow circular shape at (131, 226) with radius 29.
; PLAN: r0=155(x), r1=246(y), r2=84(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x1), r6=218(y1), r7=210(x2), r8=174(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=131(x), r11=226(y), r12=29(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 155
LDI r1, 246
LDI r2, 84
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 218
LDI r7, 210
LDI r8, 174
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 226
LDI r12, 29
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
