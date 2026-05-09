; DESCRIPTION: Renders a purple line between points (141, 26) and (22, 82).
; PLAN: r0=141(x1), r1=26(y1), r2=22(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 26
LDI r2, 22
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
