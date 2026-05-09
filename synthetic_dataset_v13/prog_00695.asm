; DESCRIPTION: Renders a white line between points (29, 176) and (89, 96).
; PLAN: r0=29(x1), r1=176(y1), r2=89(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 176
LDI r2, 89
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
