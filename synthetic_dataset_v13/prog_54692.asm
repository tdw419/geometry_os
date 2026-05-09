; DESCRIPTION: Places a purple line segment connecting (161, 98) to (396, 6).
; PLAN: r0=161(x1), r1=98(y1), r2=396(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 98
LDI r2, 396
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
