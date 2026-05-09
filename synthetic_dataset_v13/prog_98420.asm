; DESCRIPTION: Draws a white line from (89, 227) to (47, 123).
; PLAN: r0=89(x1), r1=227(y1), r2=47(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 227
LDI r2, 47
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
