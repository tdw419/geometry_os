; DESCRIPTION: Places a blue line segment connecting (19, 88) to (348, 140).
; PLAN: r0=19(x1), r1=88(y1), r2=348(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 88
LDI r2, 348
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
