; DESCRIPTION: Renders a white line between points (24, 236) and (419, 129).
; PLAN: r0=24(x1), r1=236(y1), r2=419(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 236
LDI r2, 419
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
