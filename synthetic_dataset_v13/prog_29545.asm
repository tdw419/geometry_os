; DESCRIPTION: Draws a purple line from (89, 124) to (475, 48).
; PLAN: r0=89(x1), r1=124(y1), r2=475(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 124
LDI r2, 475
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
