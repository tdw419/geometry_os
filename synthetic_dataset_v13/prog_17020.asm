; DESCRIPTION: Places a blue line segment connecting (258, 183) to (348, 69).
; PLAN: r0=258(x1), r1=183(y1), r2=348(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 183
LDI r2, 348
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
