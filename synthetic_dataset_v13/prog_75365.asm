; DESCRIPTION: Places a purple line segment connecting (427, 203) to (302, 195).
; PLAN: r0=427(x1), r1=203(y1), r2=302(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 203
LDI r2, 302
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
