; DESCRIPTION: Composite: Places a blue 91x84 rectangle at position (147, 49) then Creates a black circular shape at (331, 148) with radius 35 then Places a yellow line segment connecting (180, 234) to (87, 123).
; PLAN: r0=147(x), r1=49(y), r2=91(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=331(x), r6=148(y), r7=35(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=180(x1), r11=234(y1), r12=87(x2), r13=123(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 49
LDI r2, 91
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 148
LDI r7, 35
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 180
LDI r11, 234
LDI r12, 87
LDI r13, 123
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
