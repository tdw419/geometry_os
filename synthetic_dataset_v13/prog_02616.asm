; DESCRIPTION: Composite: Places a green circle of radius 31 at center (459, 72) then Sets a single black pixel at (448, 232) then Renders a yellow line between points (405, 21) and (106, 95).
; PLAN: r0=459(x), r1=72(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=448(x), r6=232(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=405(x1), r11=21(y1), r12=106(x2), r13=95(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 72
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 448
LDI r6, 232
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 405
LDI r11, 21
LDI r12, 106
LDI r13, 95
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
