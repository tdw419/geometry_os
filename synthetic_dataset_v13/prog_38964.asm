; DESCRIPTION: Composite: Places a green line segment connecting (407, 48) to (106, 149) then Sets a single red pixel at (349, 75) then Draws a blue circle centered at (407, 172) with radius 67.
; PLAN: r0=407(x1), r1=48(y1), r2=106(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=75(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=407(x), r11=172(y), r12=67(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 407
LDI r1, 48
LDI r2, 106
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 75
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 407
LDI r11, 172
LDI r12, 67
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
