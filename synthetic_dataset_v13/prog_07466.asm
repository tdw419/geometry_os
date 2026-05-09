; DESCRIPTION: Draws a purple line from (377, 199) to (260, 124).
; PLAN: r0=377(x1), r1=199(y1), r2=260(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 199
LDI r2, 260
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
