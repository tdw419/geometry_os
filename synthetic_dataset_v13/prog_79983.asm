; DESCRIPTION: Renders a red line between points (190, 61) and (419, 87).
; PLAN: r0=190(x1), r1=61(y1), r2=419(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 61
LDI r2, 419
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
