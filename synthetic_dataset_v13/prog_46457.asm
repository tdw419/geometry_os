; DESCRIPTION: Renders a purple line between points (454, 118) and (132, 7).
; PLAN: r0=454(x1), r1=118(y1), r2=132(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 118
LDI r2, 132
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
