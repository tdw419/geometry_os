; DESCRIPTION: Renders a purple line between points (481, 46) and (348, 203).
; PLAN: r0=481(x1), r1=46(y1), r2=348(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 46
LDI r2, 348
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
