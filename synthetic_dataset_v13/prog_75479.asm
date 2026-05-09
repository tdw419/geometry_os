; DESCRIPTION: Composite: Places a orange line segment connecting (181, 15) to (2, 233) then Creates a purple circular shape at (424, 203) with radius 40.
; PLAN: r0=181(x1), r1=15(y1), r2=2(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=424(x), r6=203(y), r7=40(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 181
LDI r1, 15
LDI r2, 2
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 203
LDI r7, 40
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
