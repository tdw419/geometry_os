; DESCRIPTION: Renders a purple line between points (379, 89) and (428, 123).
; PLAN: r0=379(x1), r1=89(y1), r2=428(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 89
LDI r2, 428
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
