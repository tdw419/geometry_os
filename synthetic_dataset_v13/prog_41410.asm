; DESCRIPTION: Renders a green line between points (287, 232) and (508, 145).
; PLAN: r0=287(x1), r1=232(y1), r2=508(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 232
LDI r2, 508
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
