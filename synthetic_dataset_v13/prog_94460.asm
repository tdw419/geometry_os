; DESCRIPTION: Renders a green line between points (337, 88) and (451, 81).
; PLAN: r0=337(x1), r1=88(y1), r2=451(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 88
LDI r2, 451
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
