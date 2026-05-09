; DESCRIPTION: Composite: Draws a orange line from (322, 0) to (246, 148) then Sets a single red pixel at (185, 166) then Creates a yellow circular shape at (423, 112) with radius 58.
; PLAN: r0=322(x1), r1=0(y1), r2=246(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=166(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=423(x), r11=112(y), r12=58(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 322
LDI r1, 0
LDI r2, 246
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 166
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 423
LDI r11, 112
LDI r12, 58
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
