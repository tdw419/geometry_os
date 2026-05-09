; DESCRIPTION: Renders a red line between points (471, 153) and (129, 106).
; PLAN: r0=471(x1), r1=153(y1), r2=129(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 153
LDI r2, 129
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
