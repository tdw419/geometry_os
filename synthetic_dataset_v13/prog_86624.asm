; DESCRIPTION: Renders a green line between points (4, 155) and (129, 44).
; PLAN: r0=4(x1), r1=155(y1), r2=129(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 155
LDI r2, 129
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
