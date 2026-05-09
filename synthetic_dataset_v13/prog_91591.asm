; DESCRIPTION: Places a green line segment connecting (396, 108) to (145, 72).
; PLAN: r0=396(x1), r1=108(y1), r2=145(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 108
LDI r2, 145
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
