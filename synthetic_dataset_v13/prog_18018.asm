; DESCRIPTION: Renders a yellow line between points (409, 232) and (462, 160).
; PLAN: r0=409(x1), r1=232(y1), r2=462(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 232
LDI r2, 462
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
