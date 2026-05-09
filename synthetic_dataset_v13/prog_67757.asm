; DESCRIPTION: Composite: Renders a purple disk with center (61, 104) and radius 57 then Creates a white rectangular region at (376, 131) spanning 92 by 109 pixels then Places a green line segment connecting (430, 119) to (35, 95).
; PLAN: r0=61(x), r1=104(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=131(y), r7=92(width), r8=109(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=430(x1), r11=119(y1), r12=35(x2), r13=95(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 104
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 131
LDI r7, 92
LDI r8, 109
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 430
LDI r11, 119
LDI r12, 35
LDI r13, 95
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
