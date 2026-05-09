; DESCRIPTION: Places a green line segment connecting (431, 232) to (160, 72).
; PLAN: r0=431(x1), r1=232(y1), r2=160(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 232
LDI r2, 160
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
