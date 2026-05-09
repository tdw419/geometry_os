; DESCRIPTION: Places a blue line segment connecting (348, 161) to (503, 62).
; PLAN: r0=348(x1), r1=161(y1), r2=503(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 161
LDI r2, 503
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
