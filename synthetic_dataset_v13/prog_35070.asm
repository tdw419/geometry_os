; DESCRIPTION: Composite: Places a orange line segment connecting (31, 219) to (379, 218) then Draws a yellow circle centered at (454, 133) with radius 33 then Creates a purple rectangular region at (14, 147) spanning 59 by 33 pixels.
; PLAN: r0=31(x1), r1=219(y1), r2=379(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=454(x), r6=133(y), r7=33(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=14(x), r11=147(y), r12=59(width), r13=33(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 219
LDI r2, 379
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 133
LDI r7, 33
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 14
LDI r11, 147
LDI r12, 59
LDI r13, 33
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
