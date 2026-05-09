; DESCRIPTION: Renders a white line between points (369, 3) and (466, 140).
; PLAN: r0=369(x1), r1=3(y1), r2=466(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 3
LDI r2, 466
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
