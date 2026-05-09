; DESCRIPTION: Places a purple line segment connecting (368, 81) to (22, 203).
; PLAN: r0=368(x1), r1=81(y1), r2=22(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 81
LDI r2, 22
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
