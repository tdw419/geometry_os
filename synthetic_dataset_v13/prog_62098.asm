; DESCRIPTION: Places a purple line segment connecting (126, 97) to (160, 62).
; PLAN: r0=126(x1), r1=97(y1), r2=160(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 97
LDI r2, 160
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
