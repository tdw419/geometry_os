; DESCRIPTION: Draws a orange line from (85, 245) to (56, 8).
; PLAN: r0=85(x1), r1=245(y1), r2=56(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 245
LDI r2, 56
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
