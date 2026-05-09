; DESCRIPTION: Renders a red line between points (296, 169) and (5, 100).
; PLAN: r0=296(x1), r1=169(y1), r2=5(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 169
LDI r2, 5
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
