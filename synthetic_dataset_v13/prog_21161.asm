; DESCRIPTION: Places a purple line segment connecting (430, 231) to (211, 52).
; PLAN: r0=430(x1), r1=231(y1), r2=211(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 231
LDI r2, 211
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
