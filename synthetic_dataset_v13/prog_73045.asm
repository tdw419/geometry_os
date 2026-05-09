; DESCRIPTION: Composite: Creates a blue circular shape at (61, 108) with radius 55 then Creates a red rectangular region at (22, 109) spanning 78 by 21 pixels then Places a blue line segment connecting (131, 71) to (477, 225).
; PLAN: r0=61(x), r1=108(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=22(x), r6=109(y), r7=78(width), r8=21(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=131(x1), r11=71(y1), r12=477(x2), r13=225(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 108
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 22
LDI r6, 109
LDI r7, 78
LDI r8, 21
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 71
LDI r12, 477
LDI r13, 225
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
