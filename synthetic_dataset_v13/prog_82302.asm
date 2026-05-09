; DESCRIPTION: Draws a orange line from (153, 90) to (229, 179).
; PLAN: r0=153(x1), r1=90(y1), r2=229(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 90
LDI r2, 229
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
