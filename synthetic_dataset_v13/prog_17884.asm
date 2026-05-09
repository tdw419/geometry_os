; DESCRIPTION: Places a red line segment connecting (348, 92) to (458, 32).
; PLAN: r0=348(x1), r1=92(y1), r2=458(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 92
LDI r2, 458
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
