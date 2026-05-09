; DESCRIPTION: Composite: Renders a yellow line between points (385, 156) and (307, 75) then Sets a single yellow pixel at (55, 44) then Creates a purple circular shape at (165, 72) with radius 44.
; PLAN: r0=385(x1), r1=156(y1), r2=307(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=55(x), r6=44(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=165(x), r11=72(y), r12=44(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 385
LDI r1, 156
LDI r2, 307
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 44
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 165
LDI r11, 72
LDI r12, 44
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
