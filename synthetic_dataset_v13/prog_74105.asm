; DESCRIPTION: Places a black line segment connecting (448, 165) to (244, 92).
; PLAN: r0=448(x1), r1=165(y1), r2=244(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 165
LDI r2, 244
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
