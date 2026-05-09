; DESCRIPTION: Composite: Places a green circle of radius 56 at center (423, 100) then Sets a single red pixel at (169, 2) then Renders a orange line between points (350, 162) and (489, 57).
; PLAN: r0=423(x), r1=100(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=169(x), r6=2(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=350(x1), r11=162(y1), r12=489(x2), r13=57(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 100
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 169
LDI r6, 2
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 350
LDI r11, 162
LDI r12, 489
LDI r13, 57
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
