; DESCRIPTION: Places a red line segment connecting (348, 155) to (266, 78).
; PLAN: r0=348(x1), r1=155(y1), r2=266(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 155
LDI r2, 266
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
