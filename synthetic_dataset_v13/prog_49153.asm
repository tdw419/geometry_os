; DESCRIPTION: Renders a orange line between points (328, 5) and (159, 205).
; PLAN: r0=328(x1), r1=5(y1), r2=159(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 5
LDI r2, 159
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
