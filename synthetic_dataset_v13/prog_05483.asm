; DESCRIPTION: Places a purple line segment connecting (501, 32) to (283, 25).
; PLAN: r0=501(x1), r1=32(y1), r2=283(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 32
LDI r2, 283
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
