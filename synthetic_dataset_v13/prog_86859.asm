; DESCRIPTION: Places a blue line segment connecting (261, 176) to (201, 63).
; PLAN: r0=261(x1), r1=176(y1), r2=201(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 176
LDI r2, 201
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
