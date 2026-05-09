; DESCRIPTION: Renders a red line between points (273, 243) and (314, 96).
; PLAN: r0=273(x1), r1=243(y1), r2=314(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 243
LDI r2, 314
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
