; DESCRIPTION: Composite: Renders a blue line between points (57, 198) and (369, 66) then Draws a purple circle centered at (300, 92) with radius 62 then Sets a single magenta pixel at (109, 170).
; PLAN: r0=57(x1), r1=198(y1), r2=369(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=92(y), r7=62(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=109(x), r11=170(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 57
LDI r1, 198
LDI r2, 369
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 92
LDI r7, 62
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 109
LDI r11, 170
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
