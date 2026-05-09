; DESCRIPTION: Renders a red line between points (477, 233) and (170, 77).
; PLAN: r0=477(x1), r1=233(y1), r2=170(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 233
LDI r2, 170
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
