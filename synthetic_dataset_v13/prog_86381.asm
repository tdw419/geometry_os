; DESCRIPTION: Composite: Creates a blue rectangular region at (194, 209) spanning 118 by 41 pixels then Creates a blue circular shape at (201, 158) with radius 39 then Places a red line segment connecting (364, 242) to (80, 115).
; PLAN: r0=194(x), r1=209(y), r2=118(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x), r6=158(y), r7=39(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=364(x1), r11=242(y1), r12=80(x2), r13=115(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 194
LDI r1, 209
LDI r2, 118
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 158
LDI r7, 39
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 364
LDI r11, 242
LDI r12, 80
LDI r13, 115
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
