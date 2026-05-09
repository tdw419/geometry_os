; DESCRIPTION: Composite: Draws a orange line from (20, 123) to (149, 14) then Places a black circle of radius 12 at center (352, 170) then Creates a purple rectangular region at (389, 49) spanning 28 by 96 pixels.
; PLAN: r0=20(x1), r1=123(y1), r2=149(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=352(x), r6=170(y), r7=12(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=389(x), r11=49(y), r12=28(width), r13=96(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 123
LDI r2, 149
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 170
LDI r7, 12
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 389
LDI r11, 49
LDI r12, 28
LDI r13, 96
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
