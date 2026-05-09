; DESCRIPTION: Draws a red line from (251, 219) to (188, 157).
; PLAN: r0=251(x1), r1=219(y1), r2=188(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 219
LDI r2, 188
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
