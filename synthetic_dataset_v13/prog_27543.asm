; DESCRIPTION: Composite: Draws a orange circle centered at (446, 119) with radius 22 then Draws a magenta line from (419, 100) to (312, 76) then Creates a purple rectangular region at (161, 52) spanning 26 by 62 pixels.
; PLAN: r0=446(x), r1=119(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x1), r6=100(y1), r7=312(x2), r8=76(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=161(x), r11=52(y), r12=26(width), r13=62(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 446
LDI r1, 119
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 100
LDI r7, 312
LDI r8, 76
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 52
LDI r12, 26
LDI r13, 62
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
