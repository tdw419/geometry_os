; DESCRIPTION: Composite: Renders a green line between points (190, 75) and (339, 191) then Places a green circle of radius 54 at center (297, 91) then Creates a yellow rectangular region at (172, 29) spanning 76 by 112 pixels.
; PLAN: r0=190(x1), r1=75(y1), r2=339(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=91(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=172(x), r11=29(y), r12=76(width), r13=112(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 75
LDI r2, 339
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 91
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 172
LDI r11, 29
LDI r12, 76
LDI r13, 112
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
