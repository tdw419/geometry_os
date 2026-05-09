; DESCRIPTION: Renders a orange line between points (462, 236) and (66, 212).
; PLAN: r0=462(x1), r1=236(y1), r2=66(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 236
LDI r2, 66
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
