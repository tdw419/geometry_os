; DESCRIPTION: Places a purple line segment connecting (134, 12) to (99, 159).
; PLAN: r0=134(x1), r1=12(y1), r2=99(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 12
LDI r2, 99
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
