; DESCRIPTION: Renders a white line between points (204, 136) and (236, 96).
; PLAN: r0=204(x1), r1=136(y1), r2=236(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 136
LDI r2, 236
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
