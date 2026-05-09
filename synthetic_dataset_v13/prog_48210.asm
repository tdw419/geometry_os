; DESCRIPTION: Renders a red line between points (89, 74) and (193, 125).
; PLAN: r0=89(x1), r1=74(y1), r2=193(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 74
LDI r2, 193
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
