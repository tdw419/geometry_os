; DESCRIPTION: Composite: Draws a green line from (272, 252) to (388, 182) then Creates a blue circular shape at (72, 52) with radius 19 then Sets a single black pixel at (199, 203).
; PLAN: r0=272(x1), r1=252(y1), r2=388(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=52(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=199(x), r11=203(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 272
LDI r1, 252
LDI r2, 388
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 52
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 199
LDI r11, 203
LDI r12, 0x000000
PSET r10, r11, r12
HALT
