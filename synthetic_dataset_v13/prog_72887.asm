; DESCRIPTION: Composite: Creates a black rectangular region at (50, 172) spanning 108 by 67 pixels then Places a red circle of radius 33 at center (259, 69) then Places a blue line segment connecting (333, 245) to (137, 41).
; PLAN: r0=50(x), r1=172(y), r2=108(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=259(x), r6=69(y), r7=33(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=333(x1), r11=245(y1), r12=137(x2), r13=41(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 50
LDI r1, 172
LDI r2, 108
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 69
LDI r7, 33
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 333
LDI r11, 245
LDI r12, 137
LDI r13, 41
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
