; DESCRIPTION: Places a purple line segment connecting (326, 5) to (454, 44).
; PLAN: r0=326(x1), r1=5(y1), r2=454(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 5
LDI r2, 454
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
