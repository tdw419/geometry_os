; DESCRIPTION: Renders a orange line between points (409, 2) and (109, 180).
; PLAN: r0=409(x1), r1=2(y1), r2=109(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 2
LDI r2, 109
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
