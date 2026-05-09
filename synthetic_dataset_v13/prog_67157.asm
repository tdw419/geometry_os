; DESCRIPTION: Renders a purple line between points (79, 65) and (471, 129).
; PLAN: r0=79(x1), r1=65(y1), r2=471(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 65
LDI r2, 471
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
