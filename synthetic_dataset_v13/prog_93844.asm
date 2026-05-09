; DESCRIPTION: Renders a purple line between points (290, 125) and (348, 133).
; PLAN: r0=290(x1), r1=125(y1), r2=348(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 125
LDI r2, 348
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
