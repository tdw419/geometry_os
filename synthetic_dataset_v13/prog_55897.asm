; DESCRIPTION: Draws a red line from (299, 199) to (311, 110).
; PLAN: r0=299(x1), r1=199(y1), r2=311(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 199
LDI r2, 311
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
