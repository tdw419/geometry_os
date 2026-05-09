; DESCRIPTION: Renders a red line between points (246, 190) and (84, 22).
; PLAN: r0=246(x1), r1=190(y1), r2=84(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 190
LDI r2, 84
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
