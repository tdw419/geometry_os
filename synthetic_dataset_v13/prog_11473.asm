; DESCRIPTION: Draws a purple line from (32, 75) to (477, 145).
; PLAN: r0=32(x1), r1=75(y1), r2=477(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 75
LDI r2, 477
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
