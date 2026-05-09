; DESCRIPTION: Renders a blue line between points (234, 9) and (155, 120).
; PLAN: r0=234(x1), r1=9(y1), r2=155(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 9
LDI r2, 155
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
