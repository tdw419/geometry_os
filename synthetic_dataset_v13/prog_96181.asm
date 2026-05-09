; DESCRIPTION: Places a purple line segment connecting (157, 176) to (307, 203).
; PLAN: r0=157(x1), r1=176(y1), r2=307(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 176
LDI r2, 307
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
