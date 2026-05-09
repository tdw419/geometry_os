; DESCRIPTION: Composite: Renders a red line between points (250, 245) and (138, 22) then Places a white circle of radius 59 at center (351, 65) then Creates a green rectangular region at (74, 109) spanning 110 by 58 pixels.
; PLAN: r0=250(x1), r1=245(y1), r2=138(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=65(y), r7=59(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=74(x), r11=109(y), r12=110(width), r13=58(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 245
LDI r2, 138
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 65
LDI r7, 59
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 74
LDI r11, 109
LDI r12, 110
LDI r13, 58
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
