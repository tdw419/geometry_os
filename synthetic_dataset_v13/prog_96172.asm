; DESCRIPTION: Draws a red line from (133, 227) to (289, 77).
; PLAN: r0=133(x1), r1=227(y1), r2=289(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 227
LDI r2, 289
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
