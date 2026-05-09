; DESCRIPTION: Renders a red line between points (248, 163) and (93, 243).
; PLAN: r0=248(x1), r1=163(y1), r2=93(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 163
LDI r2, 93
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
