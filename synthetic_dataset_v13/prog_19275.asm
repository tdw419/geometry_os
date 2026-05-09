; DESCRIPTION: Draws a black line from (448, 153) to (200, 90).
; PLAN: r0=448(x1), r1=153(y1), r2=200(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 153
LDI r2, 200
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
