; DESCRIPTION: Renders a purple line between points (188, 81) and (86, 118).
; PLAN: r0=188(x1), r1=81(y1), r2=86(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 81
LDI r2, 86
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
