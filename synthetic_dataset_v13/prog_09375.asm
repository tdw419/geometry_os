; DESCRIPTION: Draws a white line from (11, 227) to (312, 191).
; PLAN: r0=11(x1), r1=227(y1), r2=312(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 227
LDI r2, 312
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
