; DESCRIPTION: Composite: Draws a cyan circle centered at (407, 107) with radius 14 then Creates a black rectangular region at (163, 110) spanning 78 by 91 pixels then Renders a white line between points (205, 185) and (176, 156).
; PLAN: r0=407(x), r1=107(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x), r6=110(y), r7=78(width), r8=91(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=205(x1), r11=185(y1), r12=176(x2), r13=156(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 407
LDI r1, 107
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 110
LDI r7, 78
LDI r8, 91
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 185
LDI r12, 176
LDI r13, 156
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
