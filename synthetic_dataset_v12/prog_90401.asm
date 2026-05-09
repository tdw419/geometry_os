; DESCRIPTION: Renders a red line between points (194, 200) and (301, 100).
; PLAN: r0=194(x1), r1=200(y1), r2=301(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 200
LDI r2, 301
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
