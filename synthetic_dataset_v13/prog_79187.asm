; DESCRIPTION: Composite: Places a black line segment connecting (37, 220) to (218, 217) then Sets a single purple pixel at (324, 173) then Renders a blue disk with center (278, 181) and radius 69.
; PLAN: r0=37(x1), r1=220(y1), r2=218(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=173(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=278(x), r11=181(y), r12=69(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 37
LDI r1, 220
LDI r2, 218
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 173
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 278
LDI r11, 181
LDI r12, 69
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
