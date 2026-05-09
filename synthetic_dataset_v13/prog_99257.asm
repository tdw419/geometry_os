; DESCRIPTION: Places a yellow line segment connecting (348, 96) to (251, 38).
; PLAN: r0=348(x1), r1=96(y1), r2=251(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 96
LDI r2, 251
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
