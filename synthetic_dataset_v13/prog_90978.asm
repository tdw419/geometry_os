; DESCRIPTION: Composite: Draws a magenta line from (43, 52) to (473, 136) then Sets a single magenta pixel at (89, 164) then Creates a purple circular shape at (43, 212) with radius 20.
; PLAN: r0=43(x1), r1=52(y1), r2=473(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=89(x), r6=164(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=43(x), r11=212(y), r12=20(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 43
LDI r1, 52
LDI r2, 473
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 164
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 43
LDI r11, 212
LDI r12, 20
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
