; DESCRIPTION: Draws a purple line from (112, 89) to (6, 124).
; PLAN: r0=112(x1), r1=89(y1), r2=6(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 89
LDI r2, 6
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
