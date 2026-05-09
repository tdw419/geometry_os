; DESCRIPTION: Places a purple line segment connecting (328, 212) to (348, 193).
; PLAN: r0=328(x1), r1=212(y1), r2=348(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 212
LDI r2, 348
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
