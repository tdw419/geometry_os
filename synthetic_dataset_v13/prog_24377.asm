; DESCRIPTION: Composite: Creates a black rectangular region at (84, 15) spanning 109 by 84 pixels then Places a black dot at position (96, 76) then Places a blue line segment connecting (38, 49) to (312, 13).
; PLAN: r0=84(x), r1=15(y), r2=109(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=96(x), r6=76(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=38(x1), r11=49(y1), r12=312(x2), r13=13(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 84
LDI r1, 15
LDI r2, 109
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 76
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 38
LDI r11, 49
LDI r12, 312
LDI r13, 13
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
