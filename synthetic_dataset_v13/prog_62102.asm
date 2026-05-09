; DESCRIPTION: Renders a red line between points (60, 194) and (93, 116).
; PLAN: r0=60(x1), r1=194(y1), r2=93(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 194
LDI r2, 93
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
