; DESCRIPTION: Places a blue line segment connecting (350, 86) to (299, 85).
; PLAN: r0=350(x1), r1=86(y1), r2=299(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 86
LDI r2, 299
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
