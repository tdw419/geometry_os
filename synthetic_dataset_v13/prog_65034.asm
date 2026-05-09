; DESCRIPTION: Renders a red line between points (137, 133) and (250, 61).
; PLAN: r0=137(x1), r1=133(y1), r2=250(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 133
LDI r2, 250
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
