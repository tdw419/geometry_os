; DESCRIPTION: Composite: Places a yellow line segment connecting (93, 79) to (371, 233) then Sets a single green pixel at (427, 58) then Renders a blue disk with center (219, 92) and radius 31.
; PLAN: r0=93(x1), r1=79(y1), r2=371(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=427(x), r6=58(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=219(x), r11=92(y), r12=31(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 93
LDI r1, 79
LDI r2, 371
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 58
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 219
LDI r11, 92
LDI r12, 31
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
