; DESCRIPTION: Composite: Draws a orange line from (88, 44) to (116, 63) then Sets a single red pixel at (419, 238) then Renders a blue disk with center (74, 110) and radius 74.
; PLAN: r0=88(x1), r1=44(y1), r2=116(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=419(x), r6=238(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=74(x), r11=110(y), r12=74(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 88
LDI r1, 44
LDI r2, 116
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 238
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 74
LDI r11, 110
LDI r12, 74
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
