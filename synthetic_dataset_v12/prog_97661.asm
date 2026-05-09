; DESCRIPTION: Composite: Renders a red line between points (178, 85) and (100, 104) then Renders a white disk with center (199, 133) and radius 70 then Renders a white box of size 115x118 starting at (376, 101).
; PLAN: r0=178(x1), r1=85(y1), r2=100(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=199(x), r6=133(y), r7=70(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=376(x), r11=101(y), r12=115(width), r13=118(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 85
LDI r2, 100
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 133
LDI r7, 70
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 376
LDI r11, 101
LDI r12, 115
LDI r13, 118
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
