; DESCRIPTION: Places a red line segment connecting (121, 2) to (448, 147).
; PLAN: r0=121(x1), r1=2(y1), r2=448(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 2
LDI r2, 448
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
