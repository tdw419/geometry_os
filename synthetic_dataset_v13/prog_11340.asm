; DESCRIPTION: Renders a red line between points (72, 106) and (116, 62).
; PLAN: r0=72(x1), r1=106(y1), r2=116(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 106
LDI r2, 116
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
