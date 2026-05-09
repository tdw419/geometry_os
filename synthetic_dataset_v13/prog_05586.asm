; DESCRIPTION: Places a purple line segment connecting (99, 72) to (95, 159).
; PLAN: r0=99(x1), r1=72(y1), r2=95(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 72
LDI r2, 95
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
