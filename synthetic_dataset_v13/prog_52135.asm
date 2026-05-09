; DESCRIPTION: Composite: Places a blue line segment connecting (148, 250) to (20, 132) then Sets a single red pixel at (354, 19) then Draws a purple circle centered at (424, 188) with radius 34.
; PLAN: r0=148(x1), r1=250(y1), r2=20(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=354(x), r6=19(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=424(x), r11=188(y), r12=34(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 148
LDI r1, 250
LDI r2, 20
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 19
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 424
LDI r11, 188
LDI r12, 34
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
