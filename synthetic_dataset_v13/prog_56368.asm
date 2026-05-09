; DESCRIPTION: Renders a red line between points (377, 85) and (122, 129).
; PLAN: r0=377(x1), r1=85(y1), r2=122(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 85
LDI r2, 122
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
