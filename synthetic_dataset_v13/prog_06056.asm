; DESCRIPTION: Draws a orange line from (462, 76) to (66, 72).
; PLAN: r0=462(x1), r1=76(y1), r2=66(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 76
LDI r2, 66
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
