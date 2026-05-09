; DESCRIPTION: Draws a purple line from (168, 51) to (335, 145).
; PLAN: r0=168(x1), r1=51(y1), r2=335(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 51
LDI r2, 335
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
