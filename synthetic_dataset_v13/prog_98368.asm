; DESCRIPTION: Composite: Sets a single black pixel at (359, 100) then Places a orange circle of radius 15 at center (400, 123) then Places a purple line segment connecting (357, 153) to (64, 31).
; PLAN: r0=359(x), r1=100(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=123(y), r7=15(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=357(x1), r11=153(y1), r12=64(x2), r13=31(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 359
LDI r1, 100
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 400
LDI r6, 123
LDI r7, 15
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 357
LDI r11, 153
LDI r12, 64
LDI r13, 31
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
