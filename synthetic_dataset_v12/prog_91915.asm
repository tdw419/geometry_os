; DESCRIPTION: Renders a red line between points (73, 54) and (314, 95).
; PLAN: r0=73(x1), r1=54(y1), r2=314(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 54
LDI r2, 314
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
