; DESCRIPTION: Composite: Places a green dot at position (490, 123) then Creates a orange circular shape at (234, 88) with radius 20 then Creates a white rectangular region at (149, 136) spanning 110 by 83 pixels.
; PLAN: r0=490(x), r1=123(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=234(x), r6=88(y), r7=20(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=149(x), r11=136(y), r12=110(width), r13=83(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 123
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 234
LDI r6, 88
LDI r7, 20
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 149
LDI r11, 136
LDI r12, 110
LDI r13, 83
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
