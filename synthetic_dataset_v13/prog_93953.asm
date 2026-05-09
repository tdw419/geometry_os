; DESCRIPTION: Renders a red line between points (337, 197) and (181, 116).
; PLAN: r0=337(x1), r1=197(y1), r2=181(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 197
LDI r2, 181
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
