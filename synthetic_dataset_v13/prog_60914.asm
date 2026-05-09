; DESCRIPTION: Places a yellow line segment connecting (413, 249) to (348, 167).
; PLAN: r0=413(x1), r1=249(y1), r2=348(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 249
LDI r2, 348
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
