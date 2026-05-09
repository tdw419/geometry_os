; DESCRIPTION: Renders a purple line between points (153, 82) and (484, 194).
; PLAN: r0=153(x1), r1=82(y1), r2=484(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 82
LDI r2, 484
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
