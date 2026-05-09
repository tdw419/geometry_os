; DESCRIPTION: Renders a blue line between points (149, 170) and (447, 68).
; PLAN: r0=149(x1), r1=170(y1), r2=447(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 170
LDI r2, 447
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
