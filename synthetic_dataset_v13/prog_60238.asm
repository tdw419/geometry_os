; DESCRIPTION: Renders a purple line between points (109, 217) and (121, 84).
; PLAN: r0=109(x1), r1=217(y1), r2=121(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 217
LDI r2, 121
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
