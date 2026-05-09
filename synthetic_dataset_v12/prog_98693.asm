; DESCRIPTION: Composite: Renders a blue line between points (48, 85) and (407, 178) then Sets a single black pixel at (59, 165) then Renders a green disk with center (150, 92) and radius 77.
; PLAN: r0=48(x1), r1=85(y1), r2=407(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=165(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=150(x), r11=92(y), r12=77(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 48
LDI r1, 85
LDI r2, 407
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 165
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 150
LDI r11, 92
LDI r12, 77
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
