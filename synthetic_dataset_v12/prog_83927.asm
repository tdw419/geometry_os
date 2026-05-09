; DESCRIPTION: Draws a white line from (105, 218) to (203, 119).
; PLAN: r0=105(x1), r1=218(y1), r2=203(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 218
LDI r2, 203
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
