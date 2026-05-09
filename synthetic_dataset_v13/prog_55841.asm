; DESCRIPTION: Composite: Renders a orange line between points (109, 95) and (335, 173) then Creates a black circular shape at (71, 101) with radius 24 then Sets a single blue pixel at (416, 201).
; PLAN: r0=109(x1), r1=95(y1), r2=335(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=101(y), r7=24(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=416(x), r11=201(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 109
LDI r1, 95
LDI r2, 335
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 101
LDI r7, 24
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 416
LDI r11, 201
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
