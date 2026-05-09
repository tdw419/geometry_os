; DESCRIPTION: Places a blue line segment connecting (409, 194) to (454, 86).
; PLAN: r0=409(x1), r1=194(y1), r2=454(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 194
LDI r2, 454
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
