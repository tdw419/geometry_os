; DESCRIPTION: Draws a orange line from (100, 19) to (450, 247).
; PLAN: r0=100(x1), r1=19(y1), r2=450(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 19
LDI r2, 450
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
