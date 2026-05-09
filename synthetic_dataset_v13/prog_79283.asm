; DESCRIPTION: Composite: Creates a green circular shape at (308, 179) with radius 57 then Creates a green rectangular region at (204, 142) spanning 50 by 105 pixels then Renders a orange line between points (280, 23) and (37, 230).
; PLAN: r0=308(x), r1=179(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x), r6=142(y), r7=50(width), r8=105(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=280(x1), r11=23(y1), r12=37(x2), r13=230(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 179
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 142
LDI r7, 50
LDI r8, 105
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 23
LDI r12, 37
LDI r13, 230
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
