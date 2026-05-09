; DESCRIPTION: Composite: Places a white line segment connecting (473, 25) to (417, 207) then Renders a blue disk with center (379, 100) and radius 41 then Creates a purple rectangular region at (194, 165) spanning 110 by 88 pixels.
; PLAN: r0=473(x1), r1=25(y1), r2=417(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=379(x), r6=100(y), r7=41(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=194(x), r11=165(y), r12=110(width), r13=88(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 473
LDI r1, 25
LDI r2, 417
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 100
LDI r7, 41
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 194
LDI r11, 165
LDI r12, 110
LDI r13, 88
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
