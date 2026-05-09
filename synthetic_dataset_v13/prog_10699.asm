; DESCRIPTION: Draws a orange line from (145, 55) to (83, 76).
; PLAN: r0=145(x1), r1=55(y1), r2=83(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 55
LDI r2, 83
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
