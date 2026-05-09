; DESCRIPTION: Draws a orange line from (418, 100) to (46, 99).
; PLAN: r0=418(x1), r1=100(y1), r2=46(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 100
LDI r2, 46
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
