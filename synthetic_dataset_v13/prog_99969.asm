; DESCRIPTION: Places a red line segment connecting (232, 240) to (448, 58).
; PLAN: r0=232(x1), r1=240(y1), r2=448(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 240
LDI r2, 448
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
