; DESCRIPTION: Places a blue line segment connecting (23, 231) to (418, 159).
; PLAN: r0=23(x1), r1=231(y1), r2=418(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 231
LDI r2, 418
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
