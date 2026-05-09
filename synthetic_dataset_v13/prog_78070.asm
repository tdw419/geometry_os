; DESCRIPTION: Draws a white line from (229, 169) to (118, 79).
; PLAN: r0=229(x1), r1=169(y1), r2=118(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 169
LDI r2, 118
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
