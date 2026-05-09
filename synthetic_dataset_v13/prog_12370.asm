; DESCRIPTION: Draws a red line from (348, 100) to (132, 191).
; PLAN: r0=348(x1), r1=100(y1), r2=132(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 100
LDI r2, 132
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
