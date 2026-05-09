; DESCRIPTION: Renders a orange line between points (204, 115) and (324, 63).
; PLAN: r0=204(x1), r1=115(y1), r2=324(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 115
LDI r2, 324
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
