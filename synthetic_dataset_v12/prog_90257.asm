; DESCRIPTION: Places a purple line segment connecting (24, 155) to (125, 45).
; PLAN: r0=24(x1), r1=155(y1), r2=125(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 155
LDI r2, 125
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
