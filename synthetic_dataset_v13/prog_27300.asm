; DESCRIPTION: Places a purple line segment connecting (317, 203) to (370, 126).
; PLAN: r0=317(x1), r1=203(y1), r2=370(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 203
LDI r2, 370
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
