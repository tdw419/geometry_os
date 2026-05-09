; DESCRIPTION: Renders a orange line between points (203, 220) and (253, 41).
; PLAN: r0=203(x1), r1=220(y1), r2=253(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 220
LDI r2, 253
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
