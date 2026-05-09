; DESCRIPTION: Renders a purple line between points (212, 119) and (35, 177).
; PLAN: r0=212(x1), r1=119(y1), r2=35(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 119
LDI r2, 35
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
