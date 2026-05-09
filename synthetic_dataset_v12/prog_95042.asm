; DESCRIPTION: Renders a purple line between points (194, 227) and (43, 87).
; PLAN: r0=194(x1), r1=227(y1), r2=43(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 227
LDI r2, 43
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
