; DESCRIPTION: Composite: Draws a green circle centered at (414, 78) with radius 60 then Renders a black line between points (34, 199) and (21, 201) then Creates a red rectangular region at (344, 42) spanning 62 by 13 pixels.
; PLAN: r0=414(x), r1=78(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=34(x1), r6=199(y1), r7=21(x2), r8=201(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=344(x), r11=42(y), r12=62(width), r13=13(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 414
LDI r1, 78
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 34
LDI r6, 199
LDI r7, 21
LDI r8, 201
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 42
LDI r12, 62
LDI r13, 13
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
