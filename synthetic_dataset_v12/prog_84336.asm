; DESCRIPTION: Renders a orange line between points (130, 212) and (484, 193).
; PLAN: r0=130(x1), r1=212(y1), r2=484(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 212
LDI r2, 484
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
