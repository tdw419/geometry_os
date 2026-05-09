; DESCRIPTION: Composite: Sets a single blue pixel at (499, 150) then Places a orange line segment connecting (123, 88) to (244, 4) then Draws a yellow circle centered at (14, 218) with radius 11.
; PLAN: r0=499(x), r1=150(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=123(x1), r6=88(y1), r7=244(x2), r8=4(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=14(x), r11=218(y), r12=11(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 499
LDI r1, 150
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 123
LDI r6, 88
LDI r7, 244
LDI r8, 4
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 14
LDI r11, 218
LDI r12, 11
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
