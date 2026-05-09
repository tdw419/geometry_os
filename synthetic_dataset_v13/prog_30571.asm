; DESCRIPTION: Renders a red line between points (47, 182) and (83, 13).
; PLAN: r0=47(x1), r1=182(y1), r2=83(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 182
LDI r2, 83
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
