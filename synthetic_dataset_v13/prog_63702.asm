; DESCRIPTION: Draws a white line from (133, 219) to (427, 138).
; PLAN: r0=133(x1), r1=219(y1), r2=427(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 219
LDI r2, 427
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
