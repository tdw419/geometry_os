; DESCRIPTION: Renders a red line between points (47, 223) and (90, 116).
; PLAN: r0=47(x1), r1=223(y1), r2=90(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 223
LDI r2, 90
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
