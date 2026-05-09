; DESCRIPTION: Renders a yellow line between points (409, 94) and (221, 212).
; PLAN: r0=409(x1), r1=94(y1), r2=221(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 94
LDI r2, 221
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
