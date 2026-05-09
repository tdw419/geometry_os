; DESCRIPTION: Places a green line segment connecting (149, 65) to (390, 231).
; PLAN: r0=149(x1), r1=65(y1), r2=390(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 65
LDI r2, 390
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
