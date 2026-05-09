; DESCRIPTION: Draws a orange line from (419, 61) to (0, 130).
; PLAN: r0=419(x1), r1=61(y1), r2=0(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 61
LDI r2, 0
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
