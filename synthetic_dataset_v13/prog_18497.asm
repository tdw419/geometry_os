; DESCRIPTION: Renders a purple line between points (471, 141) and (458, 89).
; PLAN: r0=471(x1), r1=141(y1), r2=458(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 141
LDI r2, 458
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
