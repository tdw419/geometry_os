; DESCRIPTION: Places a purple line segment connecting (450, 207) to (348, 199).
; PLAN: r0=450(x1), r1=207(y1), r2=348(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 207
LDI r2, 348
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
