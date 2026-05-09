; DESCRIPTION: Draws a white line from (451, 51) to (312, 189).
; PLAN: r0=451(x1), r1=51(y1), r2=312(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 51
LDI r2, 312
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
