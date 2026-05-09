; DESCRIPTION: Composite: Renders a purple line between points (106, 70) and (85, 44) then Sets a single yellow pixel at (76, 200) then Places a white circle of radius 51 at center (169, 120).
; PLAN: r0=106(x1), r1=70(y1), r2=85(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=200(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=169(x), r11=120(y), r12=51(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 106
LDI r1, 70
LDI r2, 85
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 200
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 169
LDI r11, 120
LDI r12, 51
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
