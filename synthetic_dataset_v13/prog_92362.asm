; DESCRIPTION: Draws a purple line from (348, 90) to (309, 115).
; PLAN: r0=348(x1), r1=90(y1), r2=309(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 90
LDI r2, 309
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
