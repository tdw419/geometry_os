; DESCRIPTION: Places a white line segment connecting (177, 123) to (348, 196).
; PLAN: r0=177(x1), r1=123(y1), r2=348(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 123
LDI r2, 348
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
