; DESCRIPTION: Renders a yellow line between points (157, 118) and (450, 116).
; PLAN: r0=157(x1), r1=118(y1), r2=450(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 118
LDI r2, 450
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
