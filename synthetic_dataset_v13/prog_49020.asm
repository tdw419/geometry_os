; DESCRIPTION: Draws a orange line from (108, 179) to (162, 186).
; PLAN: r0=108(x1), r1=179(y1), r2=162(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 179
LDI r2, 162
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
