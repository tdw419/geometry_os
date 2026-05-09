; DESCRIPTION: Renders a purple line between points (177, 233) and (68, 145).
; PLAN: r0=177(x1), r1=233(y1), r2=68(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 233
LDI r2, 68
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
