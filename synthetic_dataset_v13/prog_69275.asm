; DESCRIPTION: Renders a orange line between points (503, 71) and (25, 122).
; PLAN: r0=503(x1), r1=71(y1), r2=25(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 71
LDI r2, 25
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
