; DESCRIPTION: Renders a white line between points (478, 81) and (361, 136).
; PLAN: r0=478(x1), r1=81(y1), r2=361(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 81
LDI r2, 361
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
