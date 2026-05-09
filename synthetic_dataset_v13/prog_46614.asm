; DESCRIPTION: Renders a red line between points (155, 109) and (73, 53).
; PLAN: r0=155(x1), r1=109(y1), r2=73(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 109
LDI r2, 73
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
