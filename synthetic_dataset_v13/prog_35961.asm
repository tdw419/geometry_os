; DESCRIPTION: Renders a green line between points (155, 210) and (451, 248).
; PLAN: r0=155(x1), r1=210(y1), r2=451(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 210
LDI r2, 451
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
