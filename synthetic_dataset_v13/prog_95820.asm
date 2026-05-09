; DESCRIPTION: Composite: Places a orange line segment connecting (144, 88) to (281, 80) then Creates a black circular shape at (154, 171) with radius 15 then Creates a blue rectangular region at (322, 50) spanning 55 by 87 pixels.
; PLAN: r0=144(x1), r1=88(y1), r2=281(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=171(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=322(x), r11=50(y), r12=55(width), r13=87(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 144
LDI r1, 88
LDI r2, 281
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 171
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 322
LDI r11, 50
LDI r12, 55
LDI r13, 87
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
