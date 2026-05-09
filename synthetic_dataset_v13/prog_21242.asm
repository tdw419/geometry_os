; DESCRIPTION: Places a purple line segment connecting (28, 4) to (252, 98).
; PLAN: r0=28(x1), r1=4(y1), r2=252(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 4
LDI r2, 252
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
