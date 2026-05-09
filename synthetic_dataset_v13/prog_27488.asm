; DESCRIPTION: Renders a red line between points (216, 82) and (448, 161).
; PLAN: r0=216(x1), r1=82(y1), r2=448(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 82
LDI r2, 448
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
