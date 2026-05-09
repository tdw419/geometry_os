; DESCRIPTION: Renders a red line between points (89, 161) and (312, 204).
; PLAN: r0=89(x1), r1=161(y1), r2=312(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 161
LDI r2, 312
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
