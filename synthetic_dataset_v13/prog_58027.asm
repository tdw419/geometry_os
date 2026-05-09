; DESCRIPTION: Renders a red line between points (9, 81) and (308, 216).
; PLAN: r0=9(x1), r1=81(y1), r2=308(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 81
LDI r2, 308
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
