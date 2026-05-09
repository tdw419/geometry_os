; DESCRIPTION: Composite: Draws a orange line from (424, 82) to (89, 83) then Sets a single black pixel at (141, 202) then Draws a magenta circle centered at (56, 130) with radius 37.
; PLAN: r0=424(x1), r1=82(y1), r2=89(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=202(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=56(x), r11=130(y), r12=37(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 424
LDI r1, 82
LDI r2, 89
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 202
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 56
LDI r11, 130
LDI r12, 37
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
