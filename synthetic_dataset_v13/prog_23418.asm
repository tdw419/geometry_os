; DESCRIPTION: Renders a red line between points (65, 119) and (461, 85).
; PLAN: r0=65(x1), r1=119(y1), r2=461(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 119
LDI r2, 461
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
