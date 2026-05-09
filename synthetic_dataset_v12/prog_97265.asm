; DESCRIPTION: Draws a red line from (85, 188) to (468, 186).
; PLAN: r0=85(x1), r1=188(y1), r2=468(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 188
LDI r2, 468
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
