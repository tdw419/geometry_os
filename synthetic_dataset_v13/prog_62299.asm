; DESCRIPTION: Places a red line segment connecting (348, 176) to (436, 167).
; PLAN: r0=348(x1), r1=176(y1), r2=436(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 176
LDI r2, 436
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
