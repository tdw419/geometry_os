; DESCRIPTION: Renders a orange line between points (118, 100) and (203, 43).
; PLAN: r0=118(x1), r1=100(y1), r2=203(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 100
LDI r2, 203
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
