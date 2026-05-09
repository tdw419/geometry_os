; DESCRIPTION: Composite: Draws a orange line from (312, 148) to (194, 124) then Places a black circle of radius 19 at center (222, 75) then Sets a single magenta pixel at (119, 84).
; PLAN: r0=312(x1), r1=148(y1), r2=194(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=222(x), r6=75(y), r7=19(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=119(x), r11=84(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 312
LDI r1, 148
LDI r2, 194
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 75
LDI r7, 19
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 119
LDI r11, 84
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
