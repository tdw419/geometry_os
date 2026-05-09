; DESCRIPTION: Composite: Creates a purple rectangular region at (407, 214) spanning 89 by 38 pixels then Places a blue circle of radius 32 at center (452, 78) then Places a green line segment connecting (226, 104) to (432, 87).
; PLAN: r0=407(x), r1=214(y), r2=89(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=452(x), r6=78(y), r7=32(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=226(x1), r11=104(y1), r12=432(x2), r13=87(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 407
LDI r1, 214
LDI r2, 89
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 78
LDI r7, 32
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 226
LDI r11, 104
LDI r12, 432
LDI r13, 87
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
