; DESCRIPTION: Renders a green line between points (422, 198) and (83, 99).
; PLAN: r0=422(x1), r1=198(y1), r2=83(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 198
LDI r2, 83
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
