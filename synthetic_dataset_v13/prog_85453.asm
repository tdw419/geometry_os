; DESCRIPTION: Renders a green line between points (86, 191) and (155, 129).
; PLAN: r0=86(x1), r1=191(y1), r2=155(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 191
LDI r2, 155
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
