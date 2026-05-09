; DESCRIPTION: Renders a orange line between points (400, 108) and (89, 203).
; PLAN: r0=400(x1), r1=108(y1), r2=89(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 108
LDI r2, 89
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
