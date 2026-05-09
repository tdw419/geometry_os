; DESCRIPTION: Renders a red line between points (477, 125) and (248, 112).
; PLAN: r0=477(x1), r1=125(y1), r2=248(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 125
LDI r2, 248
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
