; DESCRIPTION: Composite: Renders a blue disk with center (155, 99) and radius 10 then Creates a blue rectangular region at (183, 156) spanning 34 by 74 pixels then Renders a blue line between points (398, 162) and (210, 114).
; PLAN: r0=155(x), r1=99(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=156(y), r7=34(width), r8=74(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=398(x1), r11=162(y1), r12=210(x2), r13=114(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 99
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 156
LDI r7, 34
LDI r8, 74
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 398
LDI r11, 162
LDI r12, 210
LDI r13, 114
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
