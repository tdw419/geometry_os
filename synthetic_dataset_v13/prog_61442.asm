; DESCRIPTION: Composite: Draws a purple line from (181, 15) to (33, 191) then Sets a single yellow pixel at (481, 159) then Renders a blue disk with center (157, 100) and radius 61.
; PLAN: r0=181(x1), r1=15(y1), r2=33(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=481(x), r6=159(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=157(x), r11=100(y), r12=61(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 181
LDI r1, 15
LDI r2, 33
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 159
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 157
LDI r11, 100
LDI r12, 61
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
