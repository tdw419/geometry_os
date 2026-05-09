; DESCRIPTION: Places a black line segment connecting (335, 155) to (80, 160).
; PLAN: r0=335(x1), r1=155(y1), r2=80(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 155
LDI r2, 80
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
