; DESCRIPTION: Draws a white line from (348, 0) to (439, 22).
; PLAN: r0=348(x1), r1=0(y1), r2=439(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 0
LDI r2, 439
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
