; DESCRIPTION: Composite: Creates a green circular shape at (375, 196) with radius 48 then Creates a black rectangular region at (119, 80) spanning 62 by 78 pixels then Renders a red line between points (35, 172) and (433, 89).
; PLAN: r0=375(x), r1=196(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=119(x), r6=80(y), r7=62(width), r8=78(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=35(x1), r11=172(y1), r12=433(x2), r13=89(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 375
LDI r1, 196
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 119
LDI r6, 80
LDI r7, 62
LDI r8, 78
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 35
LDI r11, 172
LDI r12, 433
LDI r13, 89
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
