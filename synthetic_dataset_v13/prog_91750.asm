; DESCRIPTION: Renders a orange line between points (153, 155) and (458, 200).
; PLAN: r0=153(x1), r1=155(y1), r2=458(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 155
LDI r2, 458
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
