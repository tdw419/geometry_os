; DESCRIPTION: Places a purple line segment connecting (348, 254) to (380, 181).
; PLAN: r0=348(x1), r1=254(y1), r2=380(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 254
LDI r2, 380
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
