; DESCRIPTION: Composite: Places a orange line segment connecting (234, 200) to (79, 67) then Creates a black circular shape at (76, 217) with radius 25 then Creates a blue rectangular region at (264, 46) spanning 100 by 110 pixels.
; PLAN: r0=234(x1), r1=200(y1), r2=79(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=217(y), r7=25(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=264(x), r11=46(y), r12=100(width), r13=110(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 200
LDI r2, 79
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 217
LDI r7, 25
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 264
LDI r11, 46
LDI r12, 100
LDI r13, 110
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
