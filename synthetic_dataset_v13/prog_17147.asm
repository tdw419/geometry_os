; DESCRIPTION: Composite: Places a magenta circle of radius 80 at center (83, 96) then Sets a single blue pixel at (468, 186) then Renders a blue line between points (511, 183) and (260, 29).
; PLAN: r0=83(x), r1=96(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=468(x), r6=186(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=511(x1), r11=183(y1), r12=260(x2), r13=29(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 83
LDI r1, 96
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 468
LDI r6, 186
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 511
LDI r11, 183
LDI r12, 260
LDI r13, 29
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
