; DESCRIPTION: Composite: Renders a red line between points (190, 62) and (496, 250) then Draws a white circle centered at (473, 72) with radius 38 then Creates a black rectangular region at (18, 150) spanning 92 by 14 pixels.
; PLAN: r0=190(x1), r1=62(y1), r2=496(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=473(x), r6=72(y), r7=38(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=18(x), r11=150(y), r12=92(width), r13=14(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 62
LDI r2, 496
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 72
LDI r7, 38
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 18
LDI r11, 150
LDI r12, 92
LDI r13, 14
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
