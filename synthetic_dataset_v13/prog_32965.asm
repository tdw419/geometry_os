; DESCRIPTION: Composite: Draws a orange line from (501, 217) to (390, 111) then Places a black dot at position (426, 124) then Creates a black circular shape at (229, 81) with radius 36.
; PLAN: r0=501(x1), r1=217(y1), r2=390(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=426(x), r6=124(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=229(x), r11=81(y), r12=36(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 501
LDI r1, 217
LDI r2, 390
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 124
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 229
LDI r11, 81
LDI r12, 36
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
