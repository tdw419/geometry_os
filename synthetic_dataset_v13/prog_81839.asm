; DESCRIPTION: Renders a red line between points (315, 182) and (177, 10).
; PLAN: r0=315(x1), r1=182(y1), r2=177(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 182
LDI r2, 177
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
