; DESCRIPTION: Renders a white line between points (477, 6) and (155, 124).
; PLAN: r0=477(x1), r1=6(y1), r2=155(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 6
LDI r2, 155
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
