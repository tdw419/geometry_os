; DESCRIPTION: Renders a yellow line between points (160, 254) and (155, 233).
; PLAN: r0=160(x1), r1=254(y1), r2=155(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 254
LDI r2, 155
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
