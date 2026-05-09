; DESCRIPTION: Renders a orange line between points (422, 191) and (155, 163).
; PLAN: r0=422(x1), r1=191(y1), r2=155(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 191
LDI r2, 155
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
