; DESCRIPTION: Draws a orange line from (162, 34) to (419, 8).
; PLAN: r0=162(x1), r1=34(y1), r2=419(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 34
LDI r2, 419
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
