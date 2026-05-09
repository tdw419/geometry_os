; DESCRIPTION: Renders a purple line between points (177, 88) and (25, 223).
; PLAN: r0=177(x1), r1=88(y1), r2=25(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 88
LDI r2, 25
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
