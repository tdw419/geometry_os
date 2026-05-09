; DESCRIPTION: Renders a red line between points (134, 8) and (190, 116).
; PLAN: r0=134(x1), r1=8(y1), r2=190(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 8
LDI r2, 190
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
