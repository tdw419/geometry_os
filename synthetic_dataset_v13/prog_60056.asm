; DESCRIPTION: Composite: Creates a black rectangular region at (344, 160) spanning 33 by 19 pixels then Places a white line segment connecting (503, 59) to (249, 11) then Creates a red circular shape at (250, 183) with radius 29.
; PLAN: r0=344(x), r1=160(y), r2=33(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=503(x1), r6=59(y1), r7=249(x2), r8=11(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=250(x), r11=183(y), r12=29(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 344
LDI r1, 160
LDI r2, 33
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 503
LDI r6, 59
LDI r7, 249
LDI r8, 11
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 183
LDI r12, 29
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
