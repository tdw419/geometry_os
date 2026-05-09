; DESCRIPTION: Places a blue line segment connecting (272, 89) to (309, 131).
; PLAN: r0=272(x1), r1=89(y1), r2=309(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 89
LDI r2, 309
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
