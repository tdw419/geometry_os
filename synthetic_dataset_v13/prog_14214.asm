; DESCRIPTION: Places a purple line segment connecting (107, 51) to (445, 203).
; PLAN: r0=107(x1), r1=51(y1), r2=445(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 51
LDI r2, 445
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
