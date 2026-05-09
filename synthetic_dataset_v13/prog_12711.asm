; DESCRIPTION: Renders a red line between points (103, 158) and (334, 116).
; PLAN: r0=103(x1), r1=158(y1), r2=334(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 158
LDI r2, 334
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
