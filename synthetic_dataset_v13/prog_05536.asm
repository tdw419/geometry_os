; DESCRIPTION: Draws a purple line from (447, 212) to (357, 131).
; PLAN: r0=447(x1), r1=212(y1), r2=357(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 212
LDI r2, 357
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
