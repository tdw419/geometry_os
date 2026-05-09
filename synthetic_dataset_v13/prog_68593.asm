; DESCRIPTION: Places a magenta line segment connecting (508, 119) to (431, 197).
; PLAN: r0=508(x1), r1=119(y1), r2=431(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 119
LDI r2, 431
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
