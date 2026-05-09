; DESCRIPTION: Renders a purple line between points (177, 227) and (12, 121).
; PLAN: r0=177(x1), r1=227(y1), r2=12(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 227
LDI r2, 12
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
