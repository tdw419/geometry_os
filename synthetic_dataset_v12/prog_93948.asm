; DESCRIPTION: Draws a orange line from (179, 145) to (297, 17).
; PLAN: r0=179(x1), r1=145(y1), r2=297(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 145
LDI r2, 297
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
