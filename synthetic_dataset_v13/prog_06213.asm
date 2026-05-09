; DESCRIPTION: Composite: Renders a black line between points (112, 51) and (108, 75) then Places a yellow dot at position (36, 133) then Draws a magenta circle centered at (170, 165) with radius 79.
; PLAN: r0=112(x1), r1=51(y1), r2=108(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=36(x), r6=133(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=170(x), r11=165(y), r12=79(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 112
LDI r1, 51
LDI r2, 108
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 133
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 170
LDI r11, 165
LDI r12, 79
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
