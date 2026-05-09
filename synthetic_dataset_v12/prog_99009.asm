; DESCRIPTION: Draws a white line from (74, 201) to (318, 252).
; PLAN: r0=74(x1), r1=201(y1), r2=318(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 201
LDI r2, 318
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
