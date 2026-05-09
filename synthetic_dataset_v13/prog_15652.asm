; DESCRIPTION: Draws a purple line from (467, 7) to (89, 7).
; PLAN: r0=467(x1), r1=7(y1), r2=89(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 7
LDI r2, 89
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
