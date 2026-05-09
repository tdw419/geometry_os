; DESCRIPTION: Composite: Places a orange line segment connecting (48, 62) to (100, 191) then Sets a single blue pixel at (83, 105) then Creates a black circular shape at (232, 177) with radius 49.
; PLAN: r0=48(x1), r1=62(y1), r2=100(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=105(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=232(x), r11=177(y), r12=49(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 48
LDI r1, 62
LDI r2, 100
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 105
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 232
LDI r11, 177
LDI r12, 49
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
