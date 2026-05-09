; DESCRIPTION: Renders a orange line between points (342, 13) and (193, 203).
; PLAN: r0=342(x1), r1=13(y1), r2=193(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 13
LDI r2, 193
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
