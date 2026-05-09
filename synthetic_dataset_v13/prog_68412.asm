; DESCRIPTION: Composite: Renders a orange line between points (441, 159) and (278, 250) then Draws a magenta circle centered at (408, 109) with radius 46 then Sets a single orange pixel at (132, 230).
; PLAN: r0=441(x1), r1=159(y1), r2=278(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=408(x), r6=109(y), r7=46(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=132(x), r11=230(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 441
LDI r1, 159
LDI r2, 278
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 109
LDI r7, 46
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 132
LDI r11, 230
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
