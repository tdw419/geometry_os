; DESCRIPTION: Composite: Renders a blue line between points (121, 46) and (177, 88) then Sets a single green pixel at (387, 254) then Draws a yellow circle centered at (424, 145) with radius 61.
; PLAN: r0=121(x1), r1=46(y1), r2=177(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=387(x), r6=254(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=424(x), r11=145(y), r12=61(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 121
LDI r1, 46
LDI r2, 177
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 254
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 424
LDI r11, 145
LDI r12, 61
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
