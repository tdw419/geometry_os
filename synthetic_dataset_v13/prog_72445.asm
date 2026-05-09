; DESCRIPTION: Draws a red line from (157, 54) to (348, 131).
; PLAN: r0=157(x1), r1=54(y1), r2=348(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 54
LDI r2, 348
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
