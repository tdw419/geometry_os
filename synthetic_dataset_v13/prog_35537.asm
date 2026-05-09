; DESCRIPTION: Renders a purple line between points (389, 227) and (246, 161).
; PLAN: r0=389(x1), r1=227(y1), r2=246(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 227
LDI r2, 246
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
