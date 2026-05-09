; DESCRIPTION: Draws a blue line from (348, 70) to (99, 203).
; PLAN: r0=348(x1), r1=70(y1), r2=99(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 70
LDI r2, 99
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
