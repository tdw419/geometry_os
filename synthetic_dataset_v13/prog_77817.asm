; DESCRIPTION: Renders a red line between points (278, 89) and (467, 245).
; PLAN: r0=278(x1), r1=89(y1), r2=467(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 89
LDI r2, 467
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
