; DESCRIPTION: Draws a blue line from (486, 56) to (389, 58).
; PLAN: r0=486(x1), r1=56(y1), r2=389(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 56
LDI r2, 389
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
