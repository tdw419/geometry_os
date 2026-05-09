; DESCRIPTION: Renders a orange line between points (283, 203) and (150, 254).
; PLAN: r0=283(x1), r1=203(y1), r2=150(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 203
LDI r2, 150
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
