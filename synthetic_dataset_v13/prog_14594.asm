; DESCRIPTION: Composite: Creates a purple rectangular region at (227, 125) spanning 72 by 15 pixels then Draws a purple circle centered at (376, 76) with radius 45 then Places a green line segment connecting (317, 214) to (238, 241).
; PLAN: r0=227(x), r1=125(y), r2=72(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=376(x), r6=76(y), r7=45(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=317(x1), r11=214(y1), r12=238(x2), r13=241(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 125
LDI r2, 72
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 76
LDI r7, 45
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 317
LDI r11, 214
LDI r12, 238
LDI r13, 241
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
