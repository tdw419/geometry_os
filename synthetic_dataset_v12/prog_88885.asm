; DESCRIPTION: Draws a blue line from (357, 133) to (348, 70).
; PLAN: r0=357(x1), r1=133(y1), r2=348(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 133
LDI r2, 348
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
