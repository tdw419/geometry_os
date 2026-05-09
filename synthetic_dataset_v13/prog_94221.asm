; DESCRIPTION: Composite: Sets a single purple pixel at (366, 101) then Places a yellow line segment connecting (468, 199) to (165, 211) then Creates a black circular shape at (379, 76) with radius 56.
; PLAN: r0=366(x), r1=101(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=468(x1), r6=199(y1), r7=165(x2), r8=211(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=379(x), r11=76(y), r12=56(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 366
LDI r1, 101
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 468
LDI r6, 199
LDI r7, 165
LDI r8, 211
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 76
LDI r12, 56
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
