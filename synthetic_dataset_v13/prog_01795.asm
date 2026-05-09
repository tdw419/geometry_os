; DESCRIPTION: Composite: Renders a red disk with center (324, 160) and radius 72 then Creates a purple rectangular region at (372, 121) spanning 112 by 118 pixels then Places a red line segment connecting (47, 99) to (5, 236).
; PLAN: r0=324(x), r1=160(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x), r6=121(y), r7=112(width), r8=118(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=47(x1), r11=99(y1), r12=5(x2), r13=236(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 160
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 121
LDI r7, 112
LDI r8, 118
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 99
LDI r12, 5
LDI r13, 236
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
