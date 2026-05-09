; DESCRIPTION: Composite: Places a orange 118x71 rectangle at position (224, 148) then Creates a black circular shape at (412, 80) with radius 36 then Places a red line segment connecting (203, 158) to (85, 91).
; PLAN: r0=224(x), r1=148(y), r2=118(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x), r6=80(y), r7=36(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=203(x1), r11=158(y1), r12=85(x2), r13=91(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 224
LDI r1, 148
LDI r2, 118
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 80
LDI r7, 36
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 203
LDI r11, 158
LDI r12, 85
LDI r13, 91
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
