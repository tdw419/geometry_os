; DESCRIPTION: Draws a orange line from (348, 136) to (450, 218).
; PLAN: r0=348(x1), r1=136(y1), r2=450(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 136
LDI r2, 450
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
