; DESCRIPTION: Draws a orange line from (357, 56) to (66, 39).
; PLAN: r0=357(x1), r1=56(y1), r2=66(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 56
LDI r2, 66
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
