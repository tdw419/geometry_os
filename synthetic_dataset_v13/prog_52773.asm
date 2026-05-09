; DESCRIPTION: Draws a blue line from (471, 92) to (417, 80).
; PLAN: r0=471(x1), r1=92(y1), r2=417(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 92
LDI r2, 417
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
