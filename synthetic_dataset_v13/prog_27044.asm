; DESCRIPTION: Renders a purple line between points (199, 93) and (31, 149).
; PLAN: r0=199(x1), r1=93(y1), r2=31(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 93
LDI r2, 31
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
