; DESCRIPTION: Renders a red line between points (411, 134) and (349, 254).
; PLAN: r0=411(x1), r1=134(y1), r2=349(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 134
LDI r2, 349
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
