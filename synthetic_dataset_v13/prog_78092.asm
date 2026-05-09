; DESCRIPTION: Renders a orange line between points (117, 102) and (422, 62).
; PLAN: r0=117(x1), r1=102(y1), r2=422(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 102
LDI r2, 422
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
