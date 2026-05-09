; DESCRIPTION: Renders a green line between points (155, 232) and (176, 7).
; PLAN: r0=155(x1), r1=232(y1), r2=176(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 232
LDI r2, 176
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
