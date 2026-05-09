; DESCRIPTION: Renders a red line between points (315, 158) and (206, 96).
; PLAN: r0=315(x1), r1=158(y1), r2=206(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 158
LDI r2, 206
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
