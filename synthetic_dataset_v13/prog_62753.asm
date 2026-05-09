; DESCRIPTION: Draws a yellow line from (503, 118) to (251, 77).
; PLAN: r0=503(x1), r1=118(y1), r2=251(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 118
LDI r2, 251
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
