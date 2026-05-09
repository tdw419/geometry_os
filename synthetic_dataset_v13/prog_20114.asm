; DESCRIPTION: Places a blue line segment connecting (13, 43) to (359, 241).
; PLAN: r0=13(x1), r1=43(y1), r2=359(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 43
LDI r2, 359
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
