; DESCRIPTION: Renders a yellow line between points (484, 190) and (311, 112).
; PLAN: r0=484(x1), r1=190(y1), r2=311(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 190
LDI r2, 311
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
