; DESCRIPTION: Draws a purple line from (0, 124) to (484, 109).
; PLAN: r0=0(x1), r1=124(y1), r2=484(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 124
LDI r2, 484
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
