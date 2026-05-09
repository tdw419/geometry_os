; DESCRIPTION: Draws a orange line from (99, 229) to (47, 114).
; PLAN: r0=99(x1), r1=229(y1), r2=47(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 229
LDI r2, 47
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
