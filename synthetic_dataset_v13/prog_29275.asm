; DESCRIPTION: Places a black line segment connecting (163, 10) to (149, 79).
; PLAN: r0=163(x1), r1=10(y1), r2=149(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 10
LDI r2, 149
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
