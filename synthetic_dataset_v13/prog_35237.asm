; DESCRIPTION: Renders a red line between points (264, 118) and (85, 218).
; PLAN: r0=264(x1), r1=118(y1), r2=85(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 118
LDI r2, 85
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
