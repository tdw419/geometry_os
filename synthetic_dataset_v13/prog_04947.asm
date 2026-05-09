; DESCRIPTION: Composite: Renders a red disk with center (328, 172) and radius 43 then Sets a single yellow pixel at (376, 89) then Places a yellow line segment connecting (451, 165) to (250, 17).
; PLAN: r0=328(x), r1=172(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=89(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=451(x1), r11=165(y1), r12=250(x2), r13=17(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 172
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 89
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 451
LDI r11, 165
LDI r12, 250
LDI r13, 17
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
