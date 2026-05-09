; DESCRIPTION: Composite: Sets a single purple pixel at (484, 26) then Creates a orange circular shape at (344, 110) with radius 61 then Renders a orange line between points (345, 232) and (369, 185).
; PLAN: r0=484(x), r1=26(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=344(x), r6=110(y), r7=61(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=345(x1), r11=232(y1), r12=369(x2), r13=185(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 484
LDI r1, 26
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 344
LDI r6, 110
LDI r7, 61
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 345
LDI r11, 232
LDI r12, 369
LDI r13, 185
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
