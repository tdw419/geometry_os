; DESCRIPTION: Composite: Draws a black line from (290, 81) to (273, 134) then Sets a single magenta pixel at (282, 54) then Creates a black circular shape at (437, 159) with radius 40.
; PLAN: r0=290(x1), r1=81(y1), r2=273(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=54(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=437(x), r11=159(y), r12=40(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 81
LDI r2, 273
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 54
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 437
LDI r11, 159
LDI r12, 40
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
