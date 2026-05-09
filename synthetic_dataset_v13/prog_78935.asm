; DESCRIPTION: Renders a orange line between points (159, 180) and (377, 88).
; PLAN: r0=159(x1), r1=180(y1), r2=377(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 180
LDI r2, 377
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
