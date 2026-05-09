; DESCRIPTION: Composite: Creates a black rectangular region at (256, 29) spanning 100 by 85 pixels then Creates a purple circular shape at (421, 153) with radius 70 then Draws a orange line from (300, 75) to (471, 12).
; PLAN: r0=256(x), r1=29(y), r2=100(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x), r6=153(y), r7=70(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=300(x1), r11=75(y1), r12=471(x2), r13=12(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 29
LDI r2, 100
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 153
LDI r7, 70
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 300
LDI r11, 75
LDI r12, 471
LDI r13, 12
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
