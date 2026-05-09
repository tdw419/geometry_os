; DESCRIPTION: Places a blue line segment connecting (438, 25) to (508, 67).
; PLAN: r0=438(x1), r1=25(y1), r2=508(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 25
LDI r2, 508
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
