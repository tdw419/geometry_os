; DESCRIPTION: Places a purple line segment connecting (182, 87) to (199, 203).
; PLAN: r0=182(x1), r1=87(y1), r2=199(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 87
LDI r2, 199
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
