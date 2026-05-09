; DESCRIPTION: Places a green line segment connecting (11, 101) to (348, 193).
; PLAN: r0=11(x1), r1=101(y1), r2=348(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 101
LDI r2, 348
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
