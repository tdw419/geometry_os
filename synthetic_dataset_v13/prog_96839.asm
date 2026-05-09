; DESCRIPTION: Renders a purple line between points (348, 25) and (254, 37).
; PLAN: r0=348(x1), r1=25(y1), r2=254(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 25
LDI r2, 254
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
