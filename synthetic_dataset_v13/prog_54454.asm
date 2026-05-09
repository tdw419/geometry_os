; DESCRIPTION: Renders a white line between points (369, 75) and (503, 118).
; PLAN: r0=369(x1), r1=75(y1), r2=503(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 75
LDI r2, 503
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
