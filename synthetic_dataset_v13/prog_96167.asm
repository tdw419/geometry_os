; DESCRIPTION: Renders a orange line between points (252, 204) and (149, 237).
; PLAN: r0=252(x1), r1=204(y1), r2=149(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 204
LDI r2, 149
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
