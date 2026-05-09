; DESCRIPTION: Renders a orange line between points (462, 193) and (418, 56).
; PLAN: r0=462(x1), r1=193(y1), r2=418(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 193
LDI r2, 418
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
