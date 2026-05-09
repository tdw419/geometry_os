; DESCRIPTION: Composite: Sets a single blue pixel at (481, 227) then Renders a black line between points (475, 1) and (484, 137) then Draws a blue circle centered at (145, 149) with radius 62.
; PLAN: r0=481(x), r1=227(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=475(x1), r6=1(y1), r7=484(x2), r8=137(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=145(x), r11=149(y), r12=62(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 481
LDI r1, 227
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 475
LDI r6, 1
LDI r7, 484
LDI r8, 137
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 149
LDI r12, 62
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
