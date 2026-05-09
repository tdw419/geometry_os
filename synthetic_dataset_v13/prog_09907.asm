; DESCRIPTION: Places a purple line segment connecting (462, 208) to (348, 94).
; PLAN: r0=462(x1), r1=208(y1), r2=348(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 208
LDI r2, 348
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
