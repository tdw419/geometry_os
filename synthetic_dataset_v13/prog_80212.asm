; DESCRIPTION: Places a blue line segment connecting (129, 63) to (40, 244).
; PLAN: r0=129(x1), r1=63(y1), r2=40(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 63
LDI r2, 40
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
