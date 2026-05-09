; DESCRIPTION: Renders a blue line between points (334, 155) and (444, 221).
; PLAN: r0=334(x1), r1=155(y1), r2=444(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 155
LDI r2, 444
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
