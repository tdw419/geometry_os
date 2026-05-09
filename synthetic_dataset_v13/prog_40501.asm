; DESCRIPTION: Draws a black line from (448, 1) to (462, 36).
; PLAN: r0=448(x1), r1=1(y1), r2=462(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 1
LDI r2, 462
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
