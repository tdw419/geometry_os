; DESCRIPTION: Places a purple line segment connecting (265, 5) to (501, 118).
; PLAN: r0=265(x1), r1=5(y1), r2=501(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 5
LDI r2, 501
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
