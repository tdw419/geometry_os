; DESCRIPTION: Renders a orange line between points (422, 138) and (137, 136).
; PLAN: r0=422(x1), r1=138(y1), r2=137(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 138
LDI r2, 137
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
