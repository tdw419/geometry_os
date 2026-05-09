; DESCRIPTION: Renders a white line between points (163, 169) and (89, 75).
; PLAN: r0=163(x1), r1=169(y1), r2=89(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 169
LDI r2, 89
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
