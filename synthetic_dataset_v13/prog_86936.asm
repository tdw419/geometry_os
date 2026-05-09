; DESCRIPTION: Places a red line segment connecting (151, 32) to (348, 109).
; PLAN: r0=151(x1), r1=32(y1), r2=348(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 32
LDI r2, 348
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
