; DESCRIPTION: Composite: Creates a black circular shape at (364, 155) with radius 23 then Sets a single magenta pixel at (432, 51) then Renders a purple line between points (7, 31) and (278, 72).
; PLAN: r0=364(x), r1=155(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x), r6=51(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=7(x1), r11=31(y1), r12=278(x2), r13=72(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 155
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 51
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 7
LDI r11, 31
LDI r12, 278
LDI r13, 72
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
