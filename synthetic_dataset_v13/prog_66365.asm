; DESCRIPTION: Renders a orange line between points (210, 232) and (501, 84).
; PLAN: r0=210(x1), r1=232(y1), r2=501(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 232
LDI r2, 501
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
