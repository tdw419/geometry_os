; DESCRIPTION: Composite: Places a orange line segment connecting (498, 40) to (36, 100) then Creates a purple circular shape at (186, 46) with radius 46.
; PLAN: r0=498(x1), r1=40(y1), r2=36(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=46(y), r7=46(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 498
LDI r1, 40
LDI r2, 36
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 46
LDI r7, 46
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
