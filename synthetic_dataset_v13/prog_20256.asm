; DESCRIPTION: Places a blue line segment connecting (25, 176) to (396, 90).
; PLAN: r0=25(x1), r1=176(y1), r2=396(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 176
LDI r2, 396
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
