; DESCRIPTION: Renders a white line between points (89, 106) and (334, 140).
; PLAN: r0=89(x1), r1=106(y1), r2=334(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 106
LDI r2, 334
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
