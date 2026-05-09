; DESCRIPTION: Composite: Draws a green line from (292, 201) to (347, 92) then Sets a single black pixel at (160, 248) then Renders a magenta disk with center (152, 40) and radius 25.
; PLAN: r0=292(x1), r1=201(y1), r2=347(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=248(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=152(x), r11=40(y), r12=25(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 292
LDI r1, 201
LDI r2, 347
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 248
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 152
LDI r11, 40
LDI r12, 25
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
