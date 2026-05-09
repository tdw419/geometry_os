; DESCRIPTION: Composite: Places a orange line segment connecting (191, 17) to (427, 89) then Creates a blue circular shape at (72, 62) with radius 56.
; PLAN: r0=191(x1), r1=17(y1), r2=427(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=62(y), r7=56(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 191
LDI r1, 17
LDI r2, 427
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 62
LDI r7, 56
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
