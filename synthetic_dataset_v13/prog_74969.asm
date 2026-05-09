; DESCRIPTION: Composite: Draws a green line from (334, 6) to (227, 151) then Renders a green disk with center (308, 189) and radius 54 then Creates a green rectangular region at (163, 185) spanning 69 by 57 pixels.
; PLAN: r0=334(x1), r1=6(y1), r2=227(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=308(x), r6=189(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=163(x), r11=185(y), r12=69(width), r13=57(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 6
LDI r2, 227
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 189
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 163
LDI r11, 185
LDI r12, 69
LDI r13, 57
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
