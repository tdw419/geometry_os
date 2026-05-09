; DESCRIPTION: Renders a red line between points (509, 182) and (75, 216).
; PLAN: r0=509(x1), r1=182(y1), r2=75(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 182
LDI r2, 75
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
