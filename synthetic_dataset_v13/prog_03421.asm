; DESCRIPTION: Renders a red line between points (262, 241) and (155, 35).
; PLAN: r0=262(x1), r1=241(y1), r2=155(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 241
LDI r2, 155
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
