; DESCRIPTION: Draws a red line from (503, 201) to (311, 72).
; PLAN: r0=503(x1), r1=201(y1), r2=311(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 201
LDI r2, 311
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
