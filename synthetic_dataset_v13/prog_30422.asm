; DESCRIPTION: Places a purple line segment connecting (409, 188) to (259, 9).
; PLAN: r0=409(x1), r1=188(y1), r2=259(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 188
LDI r2, 259
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
