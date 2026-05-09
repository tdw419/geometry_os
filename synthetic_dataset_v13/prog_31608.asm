; DESCRIPTION: Draws a orange line from (24, 34) to (110, 249).
; PLAN: r0=24(x1), r1=34(y1), r2=110(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 34
LDI r2, 110
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
