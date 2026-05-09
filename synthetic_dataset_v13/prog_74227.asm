; DESCRIPTION: Places a green line segment connecting (390, 87) to (299, 185).
; PLAN: r0=390(x1), r1=87(y1), r2=299(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 87
LDI r2, 299
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
