; DESCRIPTION: Draws a orange line from (2, 140) to (357, 200).
; PLAN: r0=2(x1), r1=140(y1), r2=357(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 140
LDI r2, 357
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
