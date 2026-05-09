; DESCRIPTION: Renders a purple line between points (471, 121) and (490, 82).
; PLAN: r0=471(x1), r1=121(y1), r2=490(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 121
LDI r2, 490
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
