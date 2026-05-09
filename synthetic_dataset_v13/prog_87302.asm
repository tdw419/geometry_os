; DESCRIPTION: Renders a red line between points (477, 17) and (60, 34).
; PLAN: r0=477(x1), r1=17(y1), r2=60(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 17
LDI r2, 60
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
