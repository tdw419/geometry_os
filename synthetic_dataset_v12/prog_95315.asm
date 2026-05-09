; DESCRIPTION: Renders a white line between points (11, 34) and (419, 181).
; PLAN: r0=11(x1), r1=34(y1), r2=419(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 34
LDI r2, 419
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
