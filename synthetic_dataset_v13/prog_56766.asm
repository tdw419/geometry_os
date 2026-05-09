; DESCRIPTION: Composite: Sets a single red pixel at (11, 51) then Draws a orange line from (414, 96) to (390, 91) then Places a red circle of radius 71 at center (186, 147).
; PLAN: r0=11(x), r1=51(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=414(x1), r6=96(y1), r7=390(x2), r8=91(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=186(x), r11=147(y), r12=71(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 11
LDI r1, 51
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 414
LDI r6, 96
LDI r7, 390
LDI r8, 91
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 186
LDI r11, 147
LDI r12, 71
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
