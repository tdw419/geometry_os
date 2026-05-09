; DESCRIPTION: Composite: Creates a orange rectangular region at (232, 92) spanning 72 by 67 pixels then Renders a yellow disk with center (347, 157) and radius 41 then Draws a green line from (411, 69) to (214, 2).
; PLAN: r0=232(x), r1=92(y), r2=72(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x), r6=157(y), r7=41(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=411(x1), r11=69(y1), r12=214(x2), r13=2(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 92
LDI r2, 72
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 157
LDI r7, 41
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 411
LDI r11, 69
LDI r12, 214
LDI r13, 2
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
