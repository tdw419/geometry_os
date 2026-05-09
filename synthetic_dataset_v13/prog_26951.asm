; DESCRIPTION: Places a red line segment connecting (348, 187) to (167, 86).
; PLAN: r0=348(x1), r1=187(y1), r2=167(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 187
LDI r2, 167
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
