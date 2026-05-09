; DESCRIPTION: Renders a white line between points (197, 89) and (414, 96).
; PLAN: r0=197(x1), r1=89(y1), r2=414(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 89
LDI r2, 414
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
