; DESCRIPTION: Renders a white line between points (158, 89) and (349, 40).
; PLAN: r0=158(x1), r1=89(y1), r2=349(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 89
LDI r2, 349
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
