; DESCRIPTION: Draws a white line from (77, 169) to (419, 197).
; PLAN: r0=77(x1), r1=169(y1), r2=419(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 169
LDI r2, 419
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
