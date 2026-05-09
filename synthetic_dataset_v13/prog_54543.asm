; DESCRIPTION: Composite: Renders a green line between points (86, 251) and (447, 81) then Sets a single blue pixel at (441, 112) then Draws a green circle centered at (307, 174) with radius 60.
; PLAN: r0=86(x1), r1=251(y1), r2=447(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=441(x), r6=112(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=307(x), r11=174(y), r12=60(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 86
LDI r1, 251
LDI r2, 447
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 112
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 307
LDI r11, 174
LDI r12, 60
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
