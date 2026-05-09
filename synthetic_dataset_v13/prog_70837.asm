; DESCRIPTION: Composite: Draws a purple line from (17, 172) to (97, 24) then Creates a magenta circular shape at (260, 92) with radius 14 then Sets a single red pixel at (370, 51).
; PLAN: r0=17(x1), r1=172(y1), r2=97(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=92(y), r7=14(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=370(x), r11=51(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 17
LDI r1, 172
LDI r2, 97
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 92
LDI r7, 14
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 370
LDI r11, 51
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
