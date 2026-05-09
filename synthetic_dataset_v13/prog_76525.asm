; DESCRIPTION: Renders a purple line between points (378, 57) and (348, 93).
; PLAN: r0=378(x1), r1=57(y1), r2=348(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 57
LDI r2, 348
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
