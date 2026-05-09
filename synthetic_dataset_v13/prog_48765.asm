; DESCRIPTION: Draws a orange line from (229, 34) to (25, 12).
; PLAN: r0=229(x1), r1=34(y1), r2=25(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 34
LDI r2, 25
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
