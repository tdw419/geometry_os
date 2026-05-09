; DESCRIPTION: Renders a red line between points (341, 30) and (369, 98).
; PLAN: r0=341(x1), r1=30(y1), r2=369(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 30
LDI r2, 369
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
