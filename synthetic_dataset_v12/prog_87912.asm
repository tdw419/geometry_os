; DESCRIPTION: Places a purple line segment connecting (176, 203) to (14, 149).
; PLAN: r0=176(x1), r1=203(y1), r2=14(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 203
LDI r2, 14
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
