; DESCRIPTION: Renders a red line between points (335, 114) and (204, 238).
; PLAN: r0=335(x1), r1=114(y1), r2=204(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 114
LDI r2, 204
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
